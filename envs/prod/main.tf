data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name_prefix = "app-${var.environment}"

  common_tags = {
    ManagedBy   = "Terraform"
    Environment = var.environment
    Project     = "multi-env-subnets"
  }
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    Name = "${local.name_prefix}-vpc"
  })
}

module "subnets" {
  source = "../../modules/subnets"

  environment = var.environment
  name_prefix = local.name_prefix
  vpc_id      = aws_vpc.this.id

  subnets = {
    public = {
      cidr_block              = "10.30.1.0/24"
      availability_zone       = data.aws_availability_zones.available.names[0]
      map_public_ip_on_launch = true
      tags = {
        Tier = "public"
      }
    }
    private = {
      cidr_block        = "10.30.2.0/24"
      availability_zone = data.aws_availability_zones.available.names[1]
      tags = {
        Tier = "private"
      }
    }
    data = {
      cidr_block        = "10.30.3.0/24"
      availability_zone = data.aws_availability_zones.available.names[2]
      tags = {
        Tier = "data"
      }
    }
  }

  tags = local.common_tags
}
