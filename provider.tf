provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket            = "terraform-backend-214"
    key               = "terraform.tfstate"
    region            = "us-west-2"
    dynamodb_endpoint = "terraform-lock"
  }
}