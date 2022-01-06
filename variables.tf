variable "do_token" {
  description = "Digital Ocean API Token"
}

variable "ssh_key_fingerprint" {
  description = "Fingerprint of the public key stored on Digital Ocean"
}

variable "region" {
  description = "Digital Ocean region"
  default     = "nyc1"
}

variable "droplet_image" {
  description = "Digital Ocean droplet image name"
  default     = "debian-11-x64"
}

variable "droplet_size" {
  description = "Droplet size for server"
  default     = "s-1vcpu-1gb-intel"
}

variable "ssh_public_key" {
  description = "Local public ssh key"
  default     = "~/.ssh/id_rsa.pub"
}