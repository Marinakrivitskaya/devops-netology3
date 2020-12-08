Provider
 provider "aws" {
   access_key = ""
   secret_key = ""
   region = "us-east-2"
 }

data "aws_ami" "ubuntu" {
    most_recent = true
 filter {
  name   = "name"
  values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
    }
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}
