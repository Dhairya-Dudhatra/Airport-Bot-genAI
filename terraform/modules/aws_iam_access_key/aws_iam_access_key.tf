resource "aws_iam_access_key" "this" {
  user    = var.user
  pgp_key = var.pgp_key
  status  = var.status
}