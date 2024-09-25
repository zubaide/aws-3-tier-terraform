output "bastion_public_ip" {
  description = "The public IP of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}

output "web_public_ips" {
  description = "The public IPs of the Web Servers"
  value       = aws_instance.web[*].public_ip
}

output "app_private_ips" {
  description = "The private IPs of the App Servers"
  value       = aws_instance.app[*].private_ip
}