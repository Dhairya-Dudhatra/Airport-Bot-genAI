resource "aws_iam_openid_connect_provider" "this" {
  client_id_list  = var.client_id_list
  thumbprint_list = var.thumbprint_list
  url             = startswith(var.url, "https://") ? var.url : "https://${var.url}"
  tags            = var.tags
}
