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