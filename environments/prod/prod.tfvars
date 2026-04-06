environment = "prod"
aws_region  = "us-west-2"

vpc_cidr = "10.40.0.0/16"
availability_zones = [
  "us-west-2a",
  "us-west-2b",
  "us-west-2c"
]

private_subnet_cidrs = [
  "10.40.1.0/24",
  "10.40.2.0/24",
  "10.40.3.0/24"
]

public_subnet_cidrs = [
  "10.40.101.0/24",
  "10.40.102.0/24",
  "10.40.103.0/24"
]

cluster_version           = "1.30"
node_group_instance_types = ["m6i.large"]
node_group_desired_size   = 4
node_group_min_size       = 3
node_group_max_size       = 10
