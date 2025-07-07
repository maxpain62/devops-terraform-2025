terraform {
  backend "s3" {
    bucket = "testbkt17062025"
    key    = "env/dev/terraform.tfstate"
    region = "ap-south-1"
    #encrypt = true
  }
}