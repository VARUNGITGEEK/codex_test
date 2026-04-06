environment = "stage"
aws_region  = "us-east-2"

vpc_cidr = "10.30.0.0/16"
availability_zones = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]

private_subnet_cidrs = [
  "10.30.1.0/24",
  "10.30.2.0/24",
  "10.30.3.0/24"
]

public_subnet_cidrs = [
  "10.30.101.0/24",
  "10.30.102.0/24",
  "10.30.103.0/24"
]

cluster_version           = "1.30"
node_group_instance_types = ["m5.large"]
node_group_desired_size   = 3
node_group_min_size       = 2
node_group_max_size       = 6
