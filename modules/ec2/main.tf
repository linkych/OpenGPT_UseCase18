resource "aws_instance" "instances" {
  for_each = {
    "public"  = var.subnet_ids["public"],
    "private" = var.subnet_ids["private"]
  }

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = each.value

  tags = {
    Name = each.key
  }
}

