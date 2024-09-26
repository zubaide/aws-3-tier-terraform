# Terraform 3-tier architecture on AWS

![image](https://github.com/user-attachments/assets/bd7415d9-0212-4707-9c85-b3df8f86b9c8)


**A high-level Terraform plan for a 3-tier architecture on AWS with a Bastion Host, Web Server, App Server, and DB instance.**
1. Set up the AWS provider
2. Create a VPC
3. Create subnets (public and private)
4. Set up Internet Gateway
5. Create route tables
6. Configure security groups
7. Launch EC2 instances (Bastion, Web Server, App Server)
8. Create RDS instance for the database
9. Set up network access control lists (NACLs)

_**Now, let's go through each step in more detail:**_

**Set up the AWS provider:**
  - Configure the AWS provider with your credentials and preferred region.

**Create a VPC:**
  - Define a new VPC with an appropriate CIDR block.

**Create subnets:**
  - Create public subnets for the Bastion Host and Web Server.
  - Create private subnets for the App Server and DB instance.

**Set up Internet Gateway:**
  - Create an Internet Gateway and attach it to the VPC to allow internet access.

**Create route tables:**  - Create a public route table for public subnets, with a route to the Internet Gateway.
  - Create a private route table for private subnets.

**Configure security groups:**
  - Create security groups for each component (Bastion, Web, App, DB) with appropriate inbound and outbound rules.

**Launch EC2 instances:**
  - Create EC2 instances for the Bastion Host, Web Server, and App Server.
  - Use appropriate AMIs and instance types for each.
  - Place the Bastion Host and Web Server in public subnets.
  - Place the App Server in a private subnet.

**let me explain the purpose of each file and directory:**
```
_main.tf:_ This is the primary configuration file where we'll call our modules and define the overall architecture.
_variables.tf:_ We'll declare input variables here, which can be used across the entire configuration.
_outputs.tf:_ We'll define output values here, such as public IP addresses or endpoint URLs.
_providers.tf:_ This file will contain the provider configuration (AWS in our case).
_modules/:_ This directory contains subdirectories for each component of our infrastructure.
_terraform.tfvars: _This file is used to set values for the variables we've declared.
```
Each module (vpc, security_groups, ec2, rds) has its own set of files:

_main.tf:_ Contains the main resource definitions for that module.
_variables.tf:_ Declares input variables specific to that module.
_outputs.tf:_ Defines output values from the module.

This structure allows us to maintain a clean, organized codebase while still keeping related resources grouped together.

**Create RDS instance:**
  - Set up an RDS instance for the database in a private subnet.
  - Configure appropriate settings such as engine, version, and instance class.

**Set up Network ACLs:**
  - Configure network access control lists for additional security at the subnet level.
