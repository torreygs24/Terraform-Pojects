# 1. Create vpc
resource "aws_vpc" "prod_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name        = "Production"
    Environment = terraform.workspace
  }
}
