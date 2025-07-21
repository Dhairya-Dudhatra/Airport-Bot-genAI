resource "aws_iam_role" "this" {
  name                 = var.name
  description          = var.description
  permissions_boundary = var.permissions_boundary == "" ? null : var.permissions_boundary
  assume_role_policy   = var.assume_role_policy
  path                 = var.path != "" ? var.path : "/"
  max_session_duration = var.max_session_duration != 0 ? var.max_session_duration : 3600

  dynamic "inline_policy" {
    # if policy and name are not empty, then create the inline policy
    for_each = [for policy in var.inline_policy : policy if policy.policy != "" && policy.name != ""]

    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy
    }
  }
  force_detach_policies = var.force_detach_policies
  tags                  = var.tags
}
