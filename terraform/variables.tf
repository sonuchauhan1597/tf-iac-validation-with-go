variable "use_localstack" {
  type    = bool
  default = true
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type    = string
  default = "demo-localstack-bucket"
}
