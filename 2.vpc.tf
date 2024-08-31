resource "aws_vpc" "devops" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name  = "${var.name}-VPC"
    Owner = var.owner
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops.id

  tags = {
    Name = "${var.name} IGW"
  }
}