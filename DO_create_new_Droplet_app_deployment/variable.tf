variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_private_key_path" {
  description = "Path to the SSH private key"
  type        = string
}

variable "ssh_fingerprint" {
  description = "Fingerprint of the SSH public key added to DigitalOcean"
  type        = string
}
