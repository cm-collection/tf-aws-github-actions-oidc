data "aws_iam_policy_document" "terraform_role" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]
    principals {
      type = "Federated"
      identifiers = [
        aws_iam_openid_connect_provider.main.arn,
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = var.token_sub
    }
  }
}

resource "aws_iam_role" "terraform" {
  name               = "github-actions-terraform"
  assume_role_policy = data.aws_iam_policy_document.terraform_role.json

  depends_on = [
    aws_iam_openid_connect_provider.main,
    aws_iam_policy.terraform,
  ]
}
