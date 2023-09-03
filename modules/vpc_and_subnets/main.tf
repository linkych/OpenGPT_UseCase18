resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main_vpc"
  }
}

resource "aws_subnet" "subnets" {
  for_each = {
    "public"  = "10.0.1.0/24",
    "private" = "10.0.2.0/24"
  }

  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = each.value

  map_public_ip_on_launch = each.key == "public"

  tags = {
    Name = each.key
  }
}

