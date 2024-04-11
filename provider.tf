# Cloud Provider(AWS, GCP, Azure. etc.) or SaaS providers configuration,
# and Backend definition


# Provider Configuration
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }

    backend "s3" {
        bucket = "jj-tf-state-bucket"              # S3 Bucket Name
        key = "global/terraform.state"             # Path to tfstate in S3 Bucket
        region = "ap-northeast-2"   
        dynamodb_table = "terraform-state-lock"    # DynamoDB Table for state locking
        encrypt = true                             # Enable Encyrtion state file
    }


}

# Configure the AWS Provider
provider "aws" {
    region = "ap-northeast-2"
}



