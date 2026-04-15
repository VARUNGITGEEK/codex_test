variable "aws_region" {
  description = "AWS region for this environment."
  type        = string
  default     = "us-west-2"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "stage"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the environment VPC."
  type        = string
  default     = "10.20.0.0/16"
}
