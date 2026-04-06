environment = "qa"
aws_region  = "us-east-1"

vpc_cidr = "10.20.0.0/16"
availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

private_subnet_cidrs = [
  "10.20.1.0/24",
  "10.20.2.0/24",
  "10.20.3.0/24"
]

public_subnet_cidrs = [
  "10.20.101.0/24",
  "10.20.102.0/24",
  "10.20.103.0/24"
]

cluster_version           = "1.30"
node_group_instance_types = ["t3.large"]
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 4
