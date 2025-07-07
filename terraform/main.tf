provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket  = "testbkt17062025"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    #encrypt = true
  }
}

resource "aws_instance" "firstinstance" {
  ami           = "ami-0d03cb826412c6b0f"
  instance_type = "t2.micro"
  tags = {
    Name      = "Helloworld"
    CreatedBy = "terraform"
  }
}