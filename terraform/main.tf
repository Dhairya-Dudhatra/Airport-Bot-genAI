module "stackgen_16cb0083-c1d1-44e9-a26b-6fbcf0206dea" {
  source     = "./modules/aws_api_gateway_http_api"
  name       = "demo"
  stage_name = "dev"
  tags       = {}
}

