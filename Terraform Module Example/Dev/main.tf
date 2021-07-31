provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source      = "../Modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = module.my_vpc.vpc_id
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../Modules/ec2"
  ami_id        = "ami-0c2b8ca1dad447f8a"
  ec2_count     = "1"
  instance_type = "t2.micro"
  subnet_id     = module.my_vpc.subnet_id

}
