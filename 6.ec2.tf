resource "aws_instance" "this" {
  ami                         = var.imagename
  availability_zone           = "us-east-1a"
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids      = [aws_security_group.allowall.id]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  tags = {
    Name  = "${var.name} VM"
    Env   = var.env
    Owner = var.owner
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install nginx jq net-tools -y
  sudo systemctl start nginx && sudo systemctl enable nginx
  sudo echo "${var.name} -Public-Server> /var/www/html/index.nginx-debian.html
  EOF
}