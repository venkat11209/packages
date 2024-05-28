terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

## Select region and provide credentials
provider "aws" {
  region     = var.rglocation
  access_key = var.acesskey
  secret_key = var.secretkey
}

## Create VPC
resource "aws_vpc" "venky_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "venky_vpc" # Replace with your desired VPC name
  }
}

## Create subnet
resource "aws_subnet" "venky_subnet" {
  vpc_id     = aws_vpc.venky_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "venky_subnet" # Replace with your desired VPC name
  }
}

## Create Route Table
resource "aws_route_table" "venky_route_table" {
  vpc_id = aws_vpc.venky_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.venky_igw.id
  }

  tags = {
    Name = "venky_route_table"
  }
}

## Create Internet Gateway
resource "aws_internet_gateway" "venky_igw" {
  vpc_id = aws_vpc.venky_vpc.id

  tags = {
    Name = "venky_igw"
  }
}


## Associate Route Table with Subnet
resource "aws_route_table_association" "venky_subnet_association" {
  subnet_id      = aws_subnet.venky_subnet.id
  route_table_id = aws_route_table.venky_route_table.id
}

## Create security group
resource "aws_security_group" "venky_sg" {
  vpc_id = aws_vpc.venky_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "venky_sg"
  }
}

## Create EC2 instance
resource "aws_instance" "venky_test" {
  ami                         = var.amiid # Ubuntu 20.04 LTS AMI ID for us-east-1
  instance_type               = var.storage
  key_name                    = var.keypairname
  vpc_security_group_ids      = [aws_security_group.venky_sg.id]
  subnet_id                   = aws_subnet.venky_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "venky_test_instance" # Replace with your desired instance name
  }
}
