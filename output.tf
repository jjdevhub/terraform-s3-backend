
# Terraform State Bucket Name
output "terraform_state_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
  description = "Terraform State Bucket Name"
}

# Terraorm State Lock Table Name
output "terraform_state_lock_table_name" {
    value = aws_dynamodb_table.this.name
    description = "Terraorm State Lock Table Name"
  
}

