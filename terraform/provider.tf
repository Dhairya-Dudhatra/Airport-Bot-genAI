terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    awscc = { // AWS Cloud Control
      source  = "hashicorp/awscc"
      version = "~> 1.0"
    }
  }
}

provider "awscc" {
  region = var.region
}

provider "aws" {
  region = var.region
}
