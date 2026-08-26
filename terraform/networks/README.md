# Week 3 - Workloads VPC Networking

This folder contains the Terraform configuration for the workload networking layer of the landing zone.

## Architecture Scope

In the final landing zone design, the VPCs belong under the Workloads OU:

```text
Workloads OU
├── Dev Account
│   └── Dev VPC
├── Test Account
│   └── Test VPC
└── Prod Account
    └── Prod VPC