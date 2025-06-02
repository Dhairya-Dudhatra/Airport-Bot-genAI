module "stackgen_001ee71b-8dc9-5209-a362-c54e2a72a63a" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "hello-kitty-images-renewing-alpaca"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    Application = "hello-kitty"
    Environment = "demo"
    Repository  = "sample-apps-infra"
    Terraform   = "true"
  }
}

module "stackgen_0dbabcd6-0b5f-51db-942f-53ae4dc4ec8c" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "180217099948-states"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    Attributes = "state"
    Name       = "180217099948-states"
    Namespace  = "180217099948"
    Repository = "infra"
  }
}

module "stackgen_20d83b40-e7d1-5a7c-9cf0-56dc9523d748" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "retroboard.demo.appcd.io"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    Application = "retroboard"
    Environment = "sandbox"
    Repository  = "infra"
    Terraform   = "true"
  }
}

