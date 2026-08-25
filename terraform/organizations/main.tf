resource "aws_organizations_organization" "main" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "security_ou" {
  name      = "security"
  parent_id = aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure_ou" {
  name      = "infrastructure"
  parent_id = aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_organizational_unit" "workload_ou" {
  name      = "workload"
  parent_id = aws_organizations_organization.main.roots[0].id
}

resource "aws_organizations_policy" "deny_leave_organization" {
  name        = "DenyLeaveOrganization"
  description = "Deny Leave Organization"
  type        = "SERVICE_CONTROL_POLICY"
  content = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Deny",
        "Action" : [
          "organizations:LeaveOrganization"
        ],
        "Resource" : "*"
      }
    ]
  })
}
