resource "aws_vpc" "paolo_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "paolo_vpc"
  }
}