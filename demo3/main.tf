terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0d63370a01f480818"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-02927f65de69492d5","sg-02c8f7449a3e655c1"]
  key_name = "TestStockAML"

  count = 4

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

output "hostid" {
  value = aws_instance.app_server.*.public_dns
}