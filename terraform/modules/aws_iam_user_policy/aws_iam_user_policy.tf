resource "aws_iam_user_policy" "this" {
  policy      = var.policy
  name        = var.name != "" && var.name_prefix == "" ? var.name : null
  name_prefix = var.name_prefix != "" && var.name == "" ? var.name_prefix : null
  user        = var.user
}
