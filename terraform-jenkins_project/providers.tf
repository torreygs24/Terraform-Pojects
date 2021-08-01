provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "jenkins-terraform214"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
