output "cluster_name" {
  description = "Provisioned EKS cluster name."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Provisioned EKS cluster endpoint."
  value       = module.eks.cluster_endpoint
}
