# ~/backstage-iac-repo/main.tf (Full Content)

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" # Your preferred region
}

# Define a simple S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  region = var.bucket_region
  tags = {
    Project    = "Backstage"
    Visibility = var.bucket_visibility
  }
}

variable "bucket_name" {}
variable "bucket_region" {}
variable "bucket_visibility" {}

# Output the bucket name for verification
output "bucket_name" {
  value = aws_s3_bucket.my_demo_bucket.bucket
}
