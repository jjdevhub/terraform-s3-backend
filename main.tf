#

# resource "random_id" "this" {    
# }


# Create S3 Bucket for Terraform State
# S3 Bucket..How?
resource "aws_s3_bucket" "terraform_state" {
    
    bucket = "jj-tf-state-bucket" # projectname - 


    tags = {
        Name        = "tf-state-bucket"
        Environment = ""    # Global, Shared, Dev, QA, Prod??
    }
}

# Provides a resource for controlling versioning on an S3 bucket
resource "aws_s3_bucket_versioning" "this" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration {
      status = "Enabled"
    }
}


# Provides a S3 bucket server-side encryption.
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"      # (SSE-S3)
    }
  }
}


# Provision DynamoDB Table for state locking
resource "aws_dynamodb_table" "this" {
    name = "terraform-state-lock"
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"

    attribute {
      name = "LockID"
      type = "S"
    }
}



