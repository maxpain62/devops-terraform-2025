data "aws_ami" "ubuntu" {
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250610"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_vpc" "default_vpc" {
  default = true
  region  = "ap-south-1"
}