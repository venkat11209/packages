terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = "your_token" # Replace with your DigitalOcean API token
}

## Create VPC
resource "digitalocean_vpc" "venky_vpc" {
  name     = "venky-vpc" # Updated to a valid VPC name
  region   = "nyc1"      # Choose your desired region
  ip_range = "10.0.0.0/16"
}

##create ssh_key
resource "digitalocean_ssh_key" "new_ssh_key" {
  name       = "my_new_ssh_key"
  public_key = file("~/.ssh/do_ssh_key.pub") # Path to your SSH public key file
}

## Create firewall (similar to a security group)
resource "digitalocean_firewall" "venky_sg" {
  name = "venky-sg"

  droplet_ids = []

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0"] # Allow SSH traffic only from this IP
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "all"
    destination_addresses = ["0.0.0.0/0"] # Allow outbound traffic to all destinations
  }
}

## Create Droplet (EC2 instance equivalent)
resource "digitalocean_droplet" "venky_test" {
  name   = "venky-test-instance"
  region = "nyc1"             # Choose your desired region
  size   = "s-1vcpu-1gb"      # Choose your desired droplet size
  image  = "ubuntu-20-04-x64" # Ubuntu 20.04 LTS

  vpc_uuid = digitalocean_vpc.venky_vpc.id
  ssh_keys = [digitalocean_ssh_key.new_ssh_key.fingerprint]      # For creating new key with 
}
