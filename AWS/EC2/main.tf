data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "EC2" {
  ami = data.aws_ami.ubuntu
  instance_type = var.instance_type
  key_name = var.key_name
  subnet_id = var.subnet_public_id
  vpc_security_group_ids = var.VPC_id
  associate_public_ip_address = true
}