variable "environment" {
  description = "Environment name used for subnet tags."
  type        = string
}

variable "name_prefix" {
  description = "Prefix used when naming subnets."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the subnets will be created."
  type        = string
}

variable "subnets" {
  description = "Subnet definitions keyed by logical subnet name."
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = optional(bool, false)
    tags                    = optional(map(string), {})
  }))
}

variable "tags" {
  description = "Common tags applied to every subnet."
  type        = map(string)
  default     = {}
}
