# codex_test

Terraform baseline for provisioning Amazon EKS across four environments (dev, qa, stage, prod) with reusable modules and Atlantis automation.

## Quick Start

```bash
cd environments/dev
terraform init
terraform plan -var-file=dev.tfvars
```

See full documentation in `docs/README_READONLY.md`.
