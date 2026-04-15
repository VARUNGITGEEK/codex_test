output "vpc_id" {
  description = "Created VPC ID."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "Created subnet IDs."
  value       = module.subnets.subnet_ids
}
