output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_ids" {
  value = { for s in aws_subnet.subnets : s.tags["Name"] => s.id }
}

