variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the EC2 instances."
  type        = string
  default     = "ami-051f7e7f6c2f40dc1"
}

variable "subnet_ids" {
  description = "Mapping of subnet names to their IDs."
  type        = map(string)
  default     = {}
}