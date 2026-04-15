variable "aws_region" {
  description = "AWS region for this environment."
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "prod"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the environment VPC."
  type        = string
  default     = "10.30.0.0/16"
}
