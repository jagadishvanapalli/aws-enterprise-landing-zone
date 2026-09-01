variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "ap-south-2"
}

variable "project" {
  description = "The project name"
  type        = string
  default     = "aws-enterprise-landing-zone"
}