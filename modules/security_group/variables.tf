variable "name" {
  description = "Name prefix used for the security group."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created."
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH to the instance."
  type        = string
}

variable "app_port" {
  description = "Optional application port to expose. Set null to disable."
  type        = number
  default     = null
}

variable "app_cidr" {
  description = "CIDR block allowed to reach the application port."
  type        = string
  default     = "0.0.0.0/0"
}

variable "tags" {
  description = "Tags applied to the security group."
  type        = map(string)
  default     = {}
}

