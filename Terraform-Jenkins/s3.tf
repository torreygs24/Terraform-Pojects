resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_app_s3_bucket
  acl    = "private"

  tags = {
    Name        = "webserver-backend-214"
    Environment = terraform.workspace
  }
}