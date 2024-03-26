terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    # access_key = 
    # secret_key = 
}

resource "aws_s3_bucket" "accer_bucket" {
  bucket = "s3acceleration"
}

resource "aws_s3_bucket_accelerate_configuration" "accer_bucket_confi" {
    bucket = aws_s3_bucket.accer_bucket.id 
    status = "Enabled"
}