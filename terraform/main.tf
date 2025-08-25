module "stackgen_25829928-51c1-4cf6-9b29-301d53fd47ce" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "tes-dhairya-random-name"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}

