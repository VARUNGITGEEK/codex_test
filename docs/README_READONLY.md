# Multi-Environment Terraform EKS Platform (Read-Only Documentation)

This repository defines a **multi-module Terraform architecture** that provisions AWS EKS across four environments:

- Dev
- QA
- Stage
- Prod

## Layout

- `modules/network`: Reusable VPC networking module using `terraform-aws-modules/vpc/aws`.
- `modules/eks`: Reusable EKS cluster module using `terraform-aws-modules/eks/aws`.
- `environments/dev`: Dev stack using both modules (`main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`, `backend.tf`, `dev.tfvars`).
- `environments/qa`: QA stack using both modules (`main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`, `backend.tf`, `qa.tfvars`).
- `environments/stage`: Stage stack using both modules (`main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`, `backend.tf`, `stage.tfvars`).
- `environments/prod`: Prod stack using both modules (`main.tf`, `variables.tf`, `outputs.tf`, `terraform.tf`, `backend.tf`, `prod.tfvars`).
- `atlantis.yaml`: Atlantis project/workflow configuration for all environments.

## How the deployment model works

Each environment composes two modules:

1. **Network module** creates VPC, public subnets, private subnets, and NAT gateways.
2. **EKS module** creates a Kubernetes control plane and managed node group in private subnets.

Environment-specific capacity, regions, and CIDR blocks live in the environment `.tfvars` files.


### Provider and backend separation

Each environment now keeps Terraform core/provider concerns consolidated while backend remains isolated:

- `terraform.tf`: combined Terraform version constraints + provider configuration
- `backend.tf`: backend declaration (`s3`)

This keeps the composition logic in `main.tf` focused only on module wiring and locals.

## Atlantis integration (detailed)

`atlantis.yaml` defines one Atlantis project per environment. Atlantis treats each `dir` as an independent Terraform root:

- `environments/dev`
- `environments/qa`
- `environments/stage`
- `environments/prod`

### Why this is useful

- Pull requests can plan only the environments impacted by a change.
- A change to shared modules (`modules/**`) triggers plans in all impacted environments.
- `parallel_plan` and `parallel_apply` reduce feedback time for large PRs.

### Key Atlantis settings explained

- `automerge: false`
  - Prevents Atlantis from merging PRs automatically after apply.
  - Keeps the merge decision in reviewer/release-owner control.

- `apply_requirements: [approved, mergeable]`
  - Blocks apply unless the PR has approval and can be merged cleanly.
  - Adds a minimal governance gate before infrastructure mutation.

- `autoplan.when_modified`
  - `../../modules/**/*.tf`: react to reusable module changes.
  - `**/*.tf`: react to terraform file changes in the environment.
  - `*.tfvars`: react to variable/value changes for the environment.

- Workflow step `plan` extra args:
  - `-input=false` for non-interactive CI execution.
  - `-lock-timeout=5m` to wait on state locks before failing.

## Usage examples

From an environment folder:

```bash
terraform init
terraform plan -var-file=<env>.tfvars
terraform apply -var-file=<env>.tfvars
```

Examples:

- `terraform plan -var-file=dev.tfvars` in `environments/dev`
- `terraform plan -var-file=qa.tfvars` in `environments/qa`

## Notes

- This is a reference baseline and should be extended with remote state backends, IAM boundaries, and security controls for production.
- Restrict cluster endpoint access and tighten node IAM policies before real-world rollout.
