#private subnet
resource "aws_subnet" "private-subnet" {
  count             = length(slice(local.az_names, 0, 2))
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(local.az_names))
  vpc_id            = aws_vpc.prod_vpc.id
  availability_zone = local.az_names[count.index]

  tags = {
    Name = "PrivateSubnet-{count.index + 1}"
  }
}

resource "aws_instance" "nat" {
  ami                    = var.nat_amis[var.region]
  instance_type          = "t2.micro"
  subnet_id              = local.pub_sub_ids[0]
  source_dest_check      = false
  vpc_security_group_ids = [aws_security_group.nat_sg.id]

  tags = {
    Name = "nat_instance"
  }
}

#Create customer route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = aws_instance.nat.id
  }

  route {
    ipv6_cidr_block = "::/0"
    instance_id     = aws_instance.nat.id
  }

  tags = {
    Name = "private-route"
  }
}

resource "aws_route_table_association" "private_rt_assoc" {
  count          = length(slice(local.az_names, 0, 2))
  subnet_id      = aws_subnet.private-subnet.*.id[count.index]
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_security_group" "nat_sg" {
  name        = "nat_sg"
  description = "allow private nat traffic"
  vpc_id      = aws_vpc.prod_vpc.id


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "nat_traffic"
  }
}