# codex_test

Multi-module Terraform project for creating public EC2 instances with Atlantis.

## Layout

- `envs/dev`: Development Terraform root module managed by Atlantis.
- `envs/qa`: QA Terraform root module managed by Atlantis.
- `envs/stage`: Stage Terraform root module managed by Atlantis.
- `modules/network`: VPC, public subnet, route table, and internet gateway.
- `modules/security_group`: SSH and optional application ingress.
- `modules/ec2_instance`: EC2 instance with encrypted root volume and IMDSv2.
- `atlantis.yaml`: Atlantis project and workflow configuration.

## Usage

Set a real AMI ID, safe SSH CIDR, and real state bucket details for the
environment you want to run.

```sh
cp envs/dev/terraform.tfvars.example envs/dev/terraform.tfvars
terraform -chdir=envs/dev init -backend-config=backend.hcl
terraform -chdir=envs/dev plan
terraform -chdir=envs/dev apply
```

Repeat the same pattern for `envs/qa` or `envs/stage`.

Atlantis will automatically plan changes for `dev`, `qa`, and `stage` when root
module or shared module files change. Applies require the pull request to be
approved and mergeable.
# adding in a new place holder
# more changes
