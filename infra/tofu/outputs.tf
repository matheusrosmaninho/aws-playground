output "bucket" {
  value = {
    id = module.infra_lambda_s3.id
    arn = module.infra_lambda_s3.arn
  }
  sensitive = true
}

output "userCostExplorer" {
  value = {
    name = aws_iam_user.cost_explorer_user.name
    arn = aws_iam_user.cost_explorer_user.arn
    policyName = aws_iam_policy.cost_explorer_policy.name
    policyArn = aws_iam_policy.cost_explorer_policy.arn
  }
  sensitive = true
}
