resource "digitalocean_volume" "camarilla_volume" {
  region                  = "nyc1"
  name                    = "camarilla-volume"
  size                    = 10
  initial_filesystem_type = "ext4"
  description             = "camarilla volume"
}

resource "digitalocean_droplet" "camarilla_server" {
  image  = var.droplet_image
  name   = "camarilla-server"
  region = var.region
  size   = var.droplet_size
  ssh_keys = [
    var.ssh_key_fingerprint
  ]
}

resource "digitalocean_volume_attachment" "camarilla_volume" {
  droplet_id = digitalocean_droplet.camarilla_server.id
  volume_id  = digitalocean_volume.camarilla_volume.id
}

output "public_ip_server" {
  value = digitalocean_droplet.camarilla_server.ipv4_address
}

resource "digital_ocean_firewall" "camarilla_firewall" {
  name = "inbound-ssh-only"
  droplet_ids = [digitalocean_droplet.camarilla_server.id]
  inbound_rule {
    protocol = "tcp"
    port_range = "22"
  }
  outbound_rule {
    protocol = "tcp"
    port_range = "1-65535"
  }
  outbound_rule {
    protocol= "icmp"
    port_range = "1-65535"
  }
  outbound_rule {
    protocol = "udp"
    port_range = "1-65535"
  }
}