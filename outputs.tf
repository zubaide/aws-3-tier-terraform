output "bastion_public_ip" {
  description = "The public IP of the Bastion Host"
  value       = module.compute.bastion_public_ip
}

output "web_public_ips" {
  description = "The public IPs of the Web Servers"
  value       = module.compute.web_public_ips
}

output "app_private_ips" {
  description = "The private IPs of the App Servers"
  value       = module.compute.app_private_ips
}