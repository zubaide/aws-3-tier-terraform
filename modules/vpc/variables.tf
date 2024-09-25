variable "vpc_cidr" {
  description   = "CIDR block for the VPC"
  type          = string
}

variable "public_subnet_cidrs" {
  description = "CIDR block for the Public Subnet"
  type = list(string)
}

variable "private_subnet_cidrs" {
  description = "CIDR block for the Private Subnet"
  type = list(string)
}