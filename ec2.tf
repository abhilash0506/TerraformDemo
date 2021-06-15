terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}

resource "aws_instance" "Terraform" {
  ami           = "ami-0ad704c126371a549"
  instance_type = "t2.micro"

  tags = {
    Name = "AppServerInstance"
    Purpose = "ToRunTomcatServer"
  }
}
user_data = <<-EOF
  #!bin/bash
  sudo yum install tomcat
  sudo systemctl enable tomcat
  sudo systemctl start tomcat
  EOF
