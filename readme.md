# Terraform module for integrate GitHub with AWS

## Usage

```hcl
module "github" {
  source = "git::https://github.com/cm-collection/tf-aws-github-actions-oidc.git"

  token_sub = [
    "repo:vitalvas/aws-account-config:ref:refs/heads/*",
  ]
}
```
