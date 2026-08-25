# AWS Organizations - Week 2

This folder documents and later provisions the AWS Organizations structure for the enterprise landing zone project.

## Target Organization Structure

```text
AWS Organization
├── Security OU
│   ├── Security Account
│   └── Audit Account
├── Infrastructure OU
│   └── Network Account
└── Workloads OU
    ├── Dev Account
    ├── Test Account
    └── Prod Accountor  

## Key Concepts

### AWS Organization

An AWS Organization is the top-level structure used to centrally manage multiple AWS accounts.

### Organizational Unit

An Organizational Unit, or OU, is a logical grouping of AWS accounts. Policies can be attached to OUs to apply governance controls.

### Service Control Policy

A Service Control Policy, or SCP, defines permission boundaries for accounts or OUs. SCPs do not grant permissions; they only restrict what is allowed.

### Management Account

The management account is the root account that owns the AWS Organization. It should be protected and used only for organization-level administration.

### Member Account

A member account is an AWS account that belongs to the AWS Organization.