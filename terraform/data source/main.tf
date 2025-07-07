resource "aws_instance" "data_source_test" {
  count                  = 2
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = "dpp-key"
  vpc_security_group_ids = [aws_security_group.tf_sg.id]
  tags = {
    Name      = "data_source_test-${count.index+1}"
    env       = "dev"
    client    = "demo"
    CreatedBy = "terraform"
  }
}

resource "aws_security_group" "tf_sg" {
  name        = "tf_sg"
  description = "tf_sg"
  vpc_id      = data.aws_vpc.default_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [data.aws_vpc.default_vpc.cidr_block]
    description = "allow ssh"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
