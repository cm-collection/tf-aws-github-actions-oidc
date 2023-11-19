variable "token_sub" {
  type = list(string)
}

variable "terraform_actions" {
  type = list(string)
  default = [
    "acm:*",
    "budgets:*",
    "cloudfront:*",
    "ec2:*",
    "iam:*",
    "organizations:*",
    "route53:*",
    "s3:*",
  ]
}
