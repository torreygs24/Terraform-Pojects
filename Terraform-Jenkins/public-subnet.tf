locals {
  az_names    = data.aws_availability_zones.azs.names
  pub_sub_ids = aws_subnet.public-subnet.*.id
}

resource "aws_subnet" "public-subnet" {
  count                   = length(local.az_names)
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  vpc_id                  = aws_vpc.prod_vpc.id
  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet-{count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "public-igw"
  }
}

resource "aws_route_table" "prt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
#5. Associate subnet with route table
resource "aws_route_table_association" "public_route" {
  count          = length(local.az_names)
  route_table_id = aws_route_table.prt.id
  subnet_id      = local.pub_sub_ids[count.index]
}

