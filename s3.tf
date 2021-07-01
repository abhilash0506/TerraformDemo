resource "aws_s3_bucket" "remote-state" { 
  bucket = "tf-static-website-remote-state" 
  tags = { 
    Name="My remote state" 
  } 
  versioning { 
    enabled = true 
  } 
} 
 
terraform { 
  backend "s3" { 
    bucket = "tf-static-website-remote-state" 
    encrypt = true 
    region = "ap-south-1" 
    key = "terraform.tfstate" 
  } 
 
} 