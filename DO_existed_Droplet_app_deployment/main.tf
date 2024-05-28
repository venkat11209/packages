terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_vpc" "venky_vpc" {
  name     = "venky-vpc"
  region   = "nyc1"
  ip_range = "10.0.0.0/16"
}

resource "null_resource" "wait_for_vpc" {
  depends_on = [digitalocean_vpc.venky_vpc]

  provisioner "local-exec" {
    command = "sleep 30" # Adjust the delay as necessary
  }
}

resource "digitalocean_droplet" "venky_test" {
  depends_on = [null_resource.wait_for_vpc]

  count = var.create_droplet ? 1 : 0

  name   = "venky-test-instance"
  region = "nyc1"
  size   = "s-1vcpu-2gb"
  image  = "ubuntu-20-04-x64"

  vpc_uuid = digitalocean_vpc.venky_vpc.id

  ssh_keys = [var.ssh_fingerprint]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file(var.ssh_private_key_path)
    host        = self.ipv4_address
  }

  lifecycle {
    ignore_changes = [user_data]
  }

  provisioner "file" {
    source      = "install_packages.sh"
    destination = "/tmp/install_packages.sh"
    on_failure  = "continue"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Running remote-exec provisioner'",
      "chmod +x /tmp/install_packages.sh",
      "/tmp/install_packages.sh",
    ]
    on_failure = "continue"
  }
}

resource "null_resource" "run_script" {
  depends_on = [digitalocean_droplet.venky_test]

  triggers = {
    script_checksum = filemd5("install_packages.sh")
    droplet_ip      = digitalocean_droplet.venky_test[0].ipv4_address
  }

  provisioner "file" {
    source      = "install_packages.sh"
    destination = "/tmp/install_packages.sh"
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_private_key_path)
      host        = digitalocean_droplet.venky_test[0].ipv4_address
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "root"
      private_key = file(var.ssh_private_key_path)
      host        = digitalocean_droplet.venky_test[0].ipv4_address
    }
    inline = [
      "chmod +x /tmp/install_packages.sh",
      "/tmp/install_packages.sh",
    ]
  }
  provisioner "local-exec" {
    command = "echo 'Reboot scheduled by remote script. Please ensure it completes manually if not already rebooted.'"
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.venky_test[0].ipv4_address
}