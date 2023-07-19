resource "aws_s3_bucket" "terraform-state" {
    bucket = "sprint-amr-bucket" 
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.terraform-state.id
    versioning_configuration {
      status = "Enabled"
    }
}

resource "aws_dynamodb_table" "state-lock" {
    name = "terraform-state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}

terraform {
  backend "s3" {
    bucket = "sprint-amr-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
  }
}