variable "name" {
  description = "Name prefix used for networking resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "availability_zones" {
  description = "Availability zones used to spread subnets."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs for worker nodes."
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs for load balancers and NAT gateways."
  type        = list(string)
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}
