variable "environment" {
  description = "Environment name."
  type        = string
}

variable "aws_region" {
  description = "AWS region used for the environment."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR for this environment."
  type        = string
}

variable "availability_zones" {
  description = "AZs used by this environment."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnets for EKS nodes."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnets for ingress/NAT."
  type        = list(string)
}

variable "cluster_version" {
  description = "EKS Kubernetes version."
  type        = string
}

variable "node_group_instance_types" {
  description = "Managed node group EC2 instance types."
  type        = list(string)
}

variable "node_group_desired_size" {
  description = "Desired node count."
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum node count."
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum node count."
  type        = number
}
