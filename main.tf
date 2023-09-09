# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
access_key = "${var.AWS_ACCESS_KEY1}"
secret_key = "${var.AWS_SECRET_KEY}"
region     = "${var.AWS_REGION}"
}

# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "Devtestlab"

    workspaces {
      name = "Terraform-AWS-Test"
    }
  }
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

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
