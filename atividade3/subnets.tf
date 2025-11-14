variable "vpc_id" {}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
