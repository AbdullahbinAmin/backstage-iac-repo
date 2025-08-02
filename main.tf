# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1" # You can change this to your preferred region, e.g., "eu-west-1"
}

# Define a simple S3 bucket
resource "aws_s3_bucket" "my_demo_bucket" {
  bucket = "s3-bucket-backstage-demo" # IMPORTANT: REPLACE THIS WITH A GLOBALLY UNIQUE NAME
  tags = {
    Environment = "Demo"
    Project     = "Backstage"
    Owner       = "AbdullahbinAmin"
    Visibility  = "Public" # We'll use this tag for policy enforcement later
  }
}

# Output the bucket name for verification
output "bucket_name" {
  value = aws_s3_bucket.my_demo_bucket.bucket
}
