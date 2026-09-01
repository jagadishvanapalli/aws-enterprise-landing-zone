variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-2"
}

variable "profile_name" {
  description = "The AWS profile name to use for authentication"
  type        = string
  default     = "aws-enterprise-landing-zone"
}