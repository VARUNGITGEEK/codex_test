variable "name" {
  description = "Name prefix used for networking resources."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the public subnet."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to networking resources."
  type        = map(string)
  default     = {}
}

