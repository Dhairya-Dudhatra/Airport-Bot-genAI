resource "aws_subnet" "this" {
  vpc_id                  = var.vpc_id
  availability_zone       = var.availability_zone
  cidr_block              = var.cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = var.tags

}
