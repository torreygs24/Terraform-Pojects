variable "vpc_cidr" {
  description = "cidr block of vpc"
  default     = "10.10.0.0/16"
}

variable "region" {
  description = "Choose region of your stack"
  type        = string
  default     = "us-east-1"
}

variable "nat_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-0dc2d3e4c0f9ebd18"
    us-east-2 = "ami-0233c2d874b811deb"

  }
}

variable "web_amis" {
  type = map(string)
  default = {
    us-east-1 = "ami-0dc2d3e4c0f9ebd18"
    us-east-2 = "ami-0233c2d874b811deb"

  }
}

variable "ec2_count" {
  description = "Choose number of ec2 instances for web"
  type        = string
  default     = "2"
}

variable "web_instance_type" {
  description = "Choice instance type for web server"
  type        = string
  default     = "t2.micro"

}

variable "web_tags" {
  type = map(string)
  default = {
    Name = "Webserver"
  }
}

variable "my_app_s3_bucket" {
  default = "webserver-backend-214"
}