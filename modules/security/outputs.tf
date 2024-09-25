output "bastion_sg_id" {
  description = "The ID of the Bastion Host security group"
  value = aws_security_group.bastion.id
}

output "web_sg_id" {
  description = "The ID of the web server security group"
  value = aws_security_group.web.id
}

output "app_sg_id" {
  description = "The ID of app server security group"
  value = aws_security_group.app.id
}