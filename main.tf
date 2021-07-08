provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAVKFKH5PN7VQEVRX2"
  secret_key = "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"
}

resource "aws_instance" "NewServer" {
     ami           = "ami-011c99152163a87ae"
     instance_type = "t3.micro"

     tags = {
       Name = "Linux"
  }
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}