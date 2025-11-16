# terraform/variables.tf
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-0866a3c8686eaeeba"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
