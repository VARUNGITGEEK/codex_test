variable "name" {
  description = "Name prefix used for the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS control plane."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster."
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the control plane and node groups."
  type        = list(string)
}

variable "node_group_instance_types" {
  description = "EC2 instance types for managed node groups."
  type        = list(string)
  default     = ["t3.large"]
}

variable "node_group_desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "node_group_min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}

variable "node_group_max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}
