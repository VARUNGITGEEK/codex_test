output "subnet_ids" {
  description = "Subnet IDs keyed by logical subnet name."
  value       = { for name, subnet in aws_subnet.this : name => subnet.id }
}

output "subnet_arns" {
  description = "Subnet ARNs keyed by logical subnet name."
  value       = { for name, subnet in aws_subnet.this : name => subnet.arn }
}

output "subnet_cidr_blocks" {
  description = "Subnet CIDR blocks keyed by logical subnet name."
  value       = { for name, subnet in aws_subnet.this : name => subnet.cidr_block }
}
