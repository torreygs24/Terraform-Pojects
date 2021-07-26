#outputs that will show up in the final config file
output "vpc-id" {
  value = aws_vpc.prod_vpc.id
}

output "nat-id" {
  value = aws_instance.nat.id
}