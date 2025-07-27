# ~/backstage-iac-repo/policies/s3_visibility_policy.rego (Full Content)

package terraform.aws.s3

# Deny if any S3 bucket tagged with Project "Backstage" has Visibility "Private"
deny[msg] {
    some i
    resource := input.resource.aws_s3_bucket[i]
    resource.tags.Project == "Backstage"
    resource.tags.Visibility == "Private"
    msg := sprintf("S3 bucket '%s' for Project 'Backstage' must have Visibility set to 'Public', but found 'Private'.", [resource.name])
}
