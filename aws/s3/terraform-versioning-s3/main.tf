# Criando um bucket versionado, que sobe um simples arquivo estático

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.42.0"
    }
  }
}

provider "aws" {
    region  = "us-east-1"
}

resource "aws_s3_bucket" "bucket_versionado" {
    bucket       = "bucket-versioning-9546525"
    force_destroy = true 
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
    bucket = aws_s3_bucket.bucket_versionado.id 
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.bucket_versionado.id 
    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_s3_bucket_website_configuration" "static_website" {
    bucket = aws_s3_bucket.bucket_versionado.id 

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}