output "organization_id" {
  description = "ID of the AWS Organization"
  value       = aws_organizations_organization.main.id
  type        = string
}

output "security_ou_id" {
  description = "ID of the Security Organizational Unit"
  value       = aws_organizations_organizational_unit.security_ou.id
  type        = string
}

output "infrastructure_ou_id" {
  description = "ID of the Infrastructure Organizational Unit"
  value       = aws_organizations_organizational_unit.infrastructure_ou.id
  type        = string
}

output "workload_ou_id" {
  description = "ID of the Workload Organizational Unit"
  value       = aws_organizations_organizational_unit.workload_ou.id
  type        = string
}