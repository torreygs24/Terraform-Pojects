variable "ec2_count" {
    default = "1"
  }

variable "instance_type" {
    default = "t2.micro"
  }
variable "ami_id" {
  default = "ami-0c2b8ca1dad447f8a"
}

variable "subnet_id" {
  default = ""
}