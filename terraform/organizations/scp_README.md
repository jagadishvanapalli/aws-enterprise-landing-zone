# Service Control Policies - Week 2

Service Control Policies, or SCPs, are organization-level guardrails in AWS Organizations.

## What SCPs Do

SCPs define the maximum available permissions for accounts in an AWS Organization.

They can be attached to:

- Organization root
- Organizational Units
- Individual member accounts

## What SCPs Do Not Do

SCPs do not grant permissions.

For example, if an IAM user does not have permission to create EC2 instances, an SCP cannot give that permission.

SCPs only restrict permissions that could otherwise be used.

## Example Guardrail: Deny Leaving the Organization

This guardrail prevents member accounts from leaving the AWS Organization.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyLeaveOrganization",
      "Effect": "Deny",
      "Action": [
        "organizations:LeaveOrganization"
      ],
      "Resource": "*"
    }
  ]
}
