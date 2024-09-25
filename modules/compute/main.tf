data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.public_subnet_ids[0]
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "web" {
  count         = 2
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id                   = var.public_subnet_ids[count.index]
  vpc_security_group_ids      = [var.web_sg_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from Web Server $(hostname -f)</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Web Server ${count.index + 1}"
  }
}

resource "aws_instance" "app" {
  count         = 2
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.micro"
  key_name      = var.key_name

  subnet_id              = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.app_sg_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y java-1.8.0-openjdk
              echo "Hello from App Server $(hostname -f)" > /home/ec2-user/app.txt
              EOF

  tags = {
    Name = "App Server ${count.index + 1}"
  }
}