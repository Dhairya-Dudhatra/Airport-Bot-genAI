module "stackgen_a3e36ace-ba90-454c-beed-54dd31dd1786" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = null
  map_public_ip_on_launch = false
  tags = {
    Name = "asefas"
  }
  vpc_id = "sasdfas"
}

