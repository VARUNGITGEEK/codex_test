environment = "dev"
aws_region  = "us-east-1"

vpc_cidr = "10.10.0.0/16"
availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

private_subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.2.0/24",
  "10.10.3.0/24"
]

public_subnet_cidrs = [
  "10.10.101.0/24",
  "10.10.102.0/24",
  "10.10.103.0/24"
]

cluster_version           = "1.30"
node_group_instance_types = ["t3.large"]
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 4
