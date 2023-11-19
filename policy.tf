data "aws_iam_policy_document" "terraform_policy" {
  statement {
    actions   = var.terraform_actions
    resources = ["*"]
  }
}

resource "aws_iam_policy" "terraform" {
  name        = "github-actions-terraform"
  path        = "/"
  description = "Policy for GitHub Actions for Terraform"
  policy      = data.aws_iam_policy_document.terraform_policy.json
}
