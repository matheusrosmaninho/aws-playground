resource "aws_iam_user" "cost_explorer_user" {
  name = "cost-explorer-user"
  path = "/"

  tags = {
    Name = "Cost Explorer User"
  }
}

resource "aws_iam_policy" "cost_explorer_policy" {
  name        = "CostExplorerReadOnlyPolicy"
  description = "Política que permite acesso de leitura ao Cost Explorer"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ce:GetCostAndUsage"
        ]
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "Cost Explorer Read Only Policy"
  }
}

resource "aws_iam_user_policy_attachment" "cost_explorer_attachment" {
  user       = aws_iam_user.cost_explorer_user.name
  policy_arn = aws_iam_policy.cost_explorer_policy.arn

  depends_on = [
    aws_iam_user.cost_explorer_user,
    aws_iam_policy.cost_explorer_policy
   ]
}
