variable "key_name" {
  description = "The key pair name for EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "The ID of the Bastion Host security group"
  type        = string
}

variable "web_sg_id" {
  description = "The ID of the Web Server security group"
  type        = string
}

variable "app_sg_id" {
  description = "The ID of the App Server security group"
  type        = string
}