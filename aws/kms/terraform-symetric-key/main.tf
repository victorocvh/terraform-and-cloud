terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
#   access_key = 
#   secret_key = 
}

data "aws_iam_user" "iam_admin" {
  user_name = "iamadmin"
}

data "aws_caller_identity" "current" {}

resource "aws_kms_key" "key" {
    description = "KMS key 1"

      # Exemplo de política de chave para permitir acesso total ao IAMAdmin
  policy = jsonencode({
    Version : "2012-10-17",
    Id      : "key-default-1",
    Statement: [
      {
        Sid       : "Allow IAMAdmin full access",
        Effect    : "Allow",
        Principal : {
          AWS : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/iamadmin"  # Substitua YOUR_ACCOUNT_ID pelo ID da sua conta
        },
        Action    : [
          "kms:*"
        ],
        Resource  : "*"
      }
    ]
  })

}

resource "aws_kms_alias" "key_alias" {
  name          = "alias/catrobot"
  target_key_id = aws_kms_key.key.key_id
}



data "aws_iam_policy_document" "kms_policy" {
  statement {
    actions   = ["kms:*"]
    resources = [aws_kms_key.key.arn]

    effect = "Allow"
  }
}