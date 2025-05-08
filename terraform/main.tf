provider "aws" {
  region                      = var.aws_region
  access_key                  = var.use_localstack ? "test" : null
  secret_key                  = var.use_localstack ? "test" : null
  skip_credentials_validation = var.use_localstack
  skip_metadata_api_check     = var.use_localstack
  endpoints {
    s3       = var.use_localstack ? "http://localhost:4566" : null
    dynamodb = var.use_localstack ? "http://localhost:4566" : null
    # Add other endpoints as needed
  }
}

resource "aws_s3_bucket" "sample_bucket" {
  bucket = var.bucket_name
}

