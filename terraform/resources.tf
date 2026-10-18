resource "regcloud_ssh_key" "timeweb_server" {
  name = "timeweb_server"
  public_key = file("/root/.ssh/id_ed25519.pub")
}

output "ssh_key_fingerprint" {
  value = regcloud_ssh_key.timeweb_server.fingerprint
}

output "ssh_key_name" {
  value = regcloud_ssh_key.timeweb_server.name
}

resource "regcloud_server" "example_server" {
  count       = 3
  name        = "server-${count.index + 1}"
  size        = "c1-m1-d10-base"
  image       = "ubuntu-24-04-amd64"
  region_slug = "openstack-spb1"
  ssh_keys    = [regcloud_ssh_key.timeweb_server.fingerprint]
  backups     = false
}

output "server_id" {
  value = regcloud_server.example_server[*].server_id
}

output "created_at" {
  value = regcloud_server.example_server[*].created_at
}

output "size" {
  value = regcloud_server.example_server[*].size
}

output "server_ips" {
    description = "List of server IPs"
    value       = regcloud_server.example_server[*].ip
}

resource "local_file" "ansible_inventory" {
  content = <<-EOT
    [webservers]
    %{ for ip in regcloud_server.example_server[*].ip_address ~}
    ${ip} ansible_user=root ansible_ssh_private_key_file=/home/user/.ssh/id_ed25519
    %{ endfor ~}
  EOT
  filename = "${path.module}/../ansible/hosts.ini"
}