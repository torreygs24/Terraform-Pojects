locals {
  env_tags = {
    Environment = terraform.workspace
  }

  web_tags = merge(var.web_tags, local.env_tags)
}

resource "aws_instance" "webserver" {
  count                  = var.ec2_count
  ami                    = var.web_amis[var.region]
  instance_type          = var.web_instance_type
  subnet_id              = local.pub_sub_ids[count.index]
  iam_instance_profile   = aws_iam_instance_profile.s3_ec2_profile.name
  vpc_security_group_ids = [aws_security_group.webserver-sgs.id]

  user_data = file("Scripts/apache.sh")

  tags = var.web_tags

}