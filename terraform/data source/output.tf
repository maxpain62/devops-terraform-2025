output "ubuntu_ami" {
  value = data.aws_ami.ubuntu.id
}

output "default_vpc" {
  value = data.aws_vpc.default_vpc.id
}