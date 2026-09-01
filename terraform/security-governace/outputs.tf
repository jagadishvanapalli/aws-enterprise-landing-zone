output "deny_delete_cloudtrail_scp_id" {
  description = "The ID of the DenyDeleteCloudTrail SCP"
  value       = aws_organizations_policy.deny_delete_cloudtrail.id
}