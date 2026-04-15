variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "us-west-2"
}

variable "aws_profile" {
  description = "Optional AWS CLI profile to use for this environment."
  type        = string
  default     = null
}

variable "name" {
  description = "Name prefix used for all resources."
  type        = string
  default     = "codex-ec2-stage"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.40.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
  default     = "10.40.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the public subnet. Leave null to let AWS choose."
  type        = string
  default     = null
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.small"
}

variable "key_name" {
  description = "Optional EC2 key pair name for SSH access."
  type        = string
  default     = null
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH to the instance."
  type        = string
  default     = "10.0.0.0/8"
}

variable "app_port" {
  description = "Optional application port to expose. Set null to disable."
  type        = number
  default     = 80
}

variable "app_cidr" {
  description = "CIDR block allowed to reach the application port."
  type        = string
  default     = "0.0.0.0/0"
}

variable "user_data" {
  description = "Optional user data script for the EC2 instance."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default = {
    Environment = "stage"
    ManagedBy   = "terraform"
  }
}

