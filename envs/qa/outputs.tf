output "instance_id" {
  description = "ID of the EC2 instance."
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = module.ec2.public_ip
}

output "vpc_id" {
  description = "ID of the VPC."
  value       = module.network.vpc_id
}

output "security_group_id" {
  description = "ID of the instance security group."
  value       = module.security_group.security_group_id
}

