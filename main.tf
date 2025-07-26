# ~/backstage-iac-repo/main.tf (Full Content)

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" # Your preferred region
}

# Define a simple S3 bucket
resource "aws_s3_bucket" "my_demo_bucket" {
  bucket = "abdullah-backstage-s3-demo-unique-jul26" # IMPORTANT: REPLACE THIS WITH A GLOBALLY UNIQUE NAME (no dots in new bucket names)
  tags = {
    Environment = "Demo"
    Project     = "Backstage"
    Owner       = "Abdullah"
    Visibility  = "Private" # We'll use this tag for policy enforcement (NON-COMPLIANT)
  }
}

# Output the bucket name for verification
output "bucket_name" {
  value = aws_s3_bucket.my_demo_bucket.bucket
}
