# Terraform Multi-Environment Subnets

This repository contains a small multi-module Terraform project for creating three AWS subnets in each of three environments:

- `dev`
- `stage`
- `prod`

Each environment creates its own VPC and then calls the shared `modules/subnets` module to create three tagged subnets.

## Layout

```text
.
├── atlantis.yaml
├── envs
│   ├── dev
│   ├── prod
│   └── stage
└── modules
    └── subnets
```

## Usage

From any environment directory:

```powershell
terraform init
terraform plan
terraform apply
```

Example:

```powershell
cd envs/dev
terraform init
terraform plan
```

Set the AWS region with `TF_VAR_aws_region` or edit the environment defaults in `variables.tf`.

## Atlantis

`atlantis.yaml` defines one project per environment. Atlantis will run plans only when files in the corresponding environment or shared subnet module change.
