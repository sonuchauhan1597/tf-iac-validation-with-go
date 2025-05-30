terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"  # Use the latest stable version
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = var.use_localstack ? "test" : null
  secret_key                  = var.use_localstack ? "test" : null
  skip_credentials_validation = var.use_localstack
  skip_metadata_api_check     = var.use_localstack
  skip_requesting_account_id  = var.use_localstack

  endpoints {
    s3       = var.use_localstack ? "http://localhost:4566" : null
    dynamodb = var.use_localstack ? "http://localhost:4566" : null
    sts      = var.use_localstack ? "http://localhost:4566" : null
    iam      = var.use_localstack ? "http://localhost:4566" : null
    # Add other endpoints as needed
    
  }

}


resource "aws_s3_bucket" "sample_bucket" {
  bucket        = var.bucket_name
  force_destroy = false  # Explicitly set default value
}

resource "aws_s3_bucket_versioning" "sample_bucket" {
  bucket = aws_s3_bucket.sample_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sample_bucket" {
  bucket = aws_s3_bucket.sample_bucket.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
