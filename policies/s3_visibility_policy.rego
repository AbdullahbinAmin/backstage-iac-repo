# package terraform.aws.s3

# deny[msg] {
#   some i
#   resource := input.resource.aws_s3_bucket[i]
#   resource.tags.Project == "Backstage"
#   resource.tags.Visibility == "Private"
#   msg := sprintf("S3 bucket '%s' for Project 'Backstage' must have Visibility set to 'Public', but found 'Private'.", [resource.name])
# }

package terraform.aws

# By default, allow all requests
default allow = true

# This is the error message that will be shown if the rule is broken
deny[msg] {
    # Find any resource in the blueprint of type "aws_s3_bucket"
    resource := input.resource.aws_s3_bucket[_]
    
    # Check if its acl (Access Control List) is NOT "private"
    resource.acl != "private"
    
    # If the condition is met, create the denial message
    msg := sprintf("S3 Bucket '%v' must be private. Public ACLs are not allowed.", [resource.bucket])
}