terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
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

resource "digitalocean_firewall" "venky_sg" {
  name = "venky-sg"

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"] # Allow SSH traffic from any IP
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"] # Allow outbound traffic to all destinations
  }
}

resource "digitalocean_droplet" "venky_test" {
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

  provisioner "file" {
    source      = "test.sh"
    destination = "/tmp/test.sh"
    on_failure  = "continue"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Running remote-exec provisioner'",
      "chmod +x /tmp/test.sh",
      "/tmp/test.sh",
    ]
    on_failure = "continue"
  }
}

output "droplet_ip" {
  value = digitalocean_droplet.venky_test.ipv4_address
}
