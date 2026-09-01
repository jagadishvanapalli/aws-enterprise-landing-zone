data "terraform_remote_state" "organizations" {
    backend = "local"
    config = {
        path = "../organizations/terraform.tfstate"
    }
}
resource "aws_organizations_policy" "deny_delete_cloudtrail" {
  name        = "DenyDeleteCloudTrail"
  description = "Deny Delete CloudTrail"
  type        = "SERVICE_CONTROL_POLICY"
  content = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Action" : [
          "cloudtrail:DeleteTrail",
          "cloudtrail:StopLogging",
          "cloudtrail:updateTrail"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_delete_cloudtrail_attachment" {
  policy_id = aws_organizations_policy.deny_delete_cloudtrail.id
  target_id = data.terraform_remote_state.organizations.outputs.workload_ou_id
}