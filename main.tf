# # main.tf
# provider "aws" {
#   region = "ap-south-1"
# }

# resource "aws_s3_bucket" "my_demo_bucket" {
#   bucket = "abdullah-backstage-s3-demo-unique-aug10" # Change this!
#   tags = {
#     Environment = "Demo"
#     Project     = "Backstage"
#     Owner       = "Abdullah"
#     Visibility  = "Private"
#   }
# }

# output "bucket_name" {
#   value = aws_s3_bucket.my_demo_bucket.bucket
# }

# This tells Terraform we are using Amazon Web Services (AWS)
provider "aws" {
  region = "us-east-1"
}

# This defines our S3 storage bucket
resource "aws_s3_bucket" "data_storage" {
  # Change this bucket name to be globally unique!
  bucket = "abdullah-banking-demo-bucket-12345"

  # This ACL (Access Control List) is what our policy will check.
  # "private" is secure. "public-read" would be a violation.
  acl = "public-read"

  # These are labels for our bucket, important for compliance
  tags = {
    Name        = "Secure-Banking-Data-Storage"
    Owner       = "Abdullah Bin Amin"
    CostCenter  = "Banking-Demo-Project"
  }
}