# Week 5 - Security and Governance

This folder contains the security and governance layer for the AWS landing zone project.

## Goal

The goal of Week 5 is to understand and implement governance guardrails and security visibility for a multi-account AWS landing zone.

## Core Concepts

### Service Control Policies

Service Control Policies, or SCPs, define the maximum available permissions for AWS accounts in an Organization.

SCPs do not grant permissions. They only restrict permissions that IAM users, roles, or services might otherwise have.

### CloudTrail

AWS CloudTrail records API activity in an AWS account.

In an enterprise landing zone, CloudTrail is used to track who did what, when, and from where.

### AWS Config

AWS Config records configuration changes to AWS resources and can evaluate whether resources follow required rules.

### Security Account

The Security account is used for centralized security tooling, monitoring, and investigation.

### Audit Account

The Audit account is used for compliance visibility, audit access, and independent review.

## Week 5 Scope

This week focuses on:

- Reviewing existing SCPs
- Creating additional guardrail SCPs
- Documenting CloudTrail design
- Documenting AWS Config design
- Preparing for centralized security logging

## Existing Guardrail

The following SCP was created in Week 2:

```text
DenyLeaveOrganization


## CloudTrail Design

AWS CloudTrail records API activity in AWS accounts. It helps answer:

- Who made the change?
- What action was performed?
- When did it happen?
- From which source IP or service?
- Was the action successful or denied?

## Landing Zone CloudTrail Pattern

In a real enterprise landing zone, CloudTrail is usually configured as an organization trail.

```text
AWS Organization
├── Management Account
│   └── Organization CloudTrail
├── Security Account
│   └── Central security monitoring
├── Audit Account
│   └── Compliance review
└── Workload Accounts
    ├── Dev
    ├── Test
    └── Prod

    -Implementation is avoided due to cost. I kept the file in disabled.

    ## AWS Config Design

AWS Config records configuration changes to AWS resources and evaluates resources against compliance rules.

CloudTrail records API activity, while AWS Config records resource configuration state.

## What AWS Config Helps Answer

- What resources exist?
- How did a resource configuration change over time?
- Is a resource compliant with required rules?
- Which resources are publicly exposed?
- Which resources are missing required encryption or tagging?

## Landing Zone AWS Config Pattern

In a real enterprise landing zone, AWS Config is usually enabled across accounts and regions.

Findings can be centralized using an AWS Config aggregator in a Security or Audit account.

```text
AWS Organization
├── Security / Audit Account
│   └── AWS Config Aggregator
├── Dev Account
│   └── AWS Config Recorder
├── Test Account
│   └── AWS Config Recorder
└── Prod Account
    └── AWS Config Recorder