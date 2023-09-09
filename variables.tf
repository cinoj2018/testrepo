# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}
variable "AWS_SECRET_KEY" {
  default = ""
}

variable "AWS_ACCESS_KEY1" {
  default = ""
}
variable "AWS_REGION" {
  default = ""
}
