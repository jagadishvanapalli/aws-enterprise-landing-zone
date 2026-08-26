variable "aws_region" {
  description = "AWS region where the resources will be created"
  type        = string
  default     = "ap-south-2"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "aws-enterprise-landing-zone"
}

variable "dev_vpc_cidr" {
  description = "CIDR block for the Dev VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "dev_public_subnet_cidr" {
  description = "CIDR block for the Dev public subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "test_vpc_cidr" {
  description = "CIDR block for the Test VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "test_public_subnet_cidr" {
  description = "CIDR block for the Test public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "prod_vpc_cidr" {
  description = "CIDR block for the Prod VPC"
  type        = string
  default     = "10.30.0.0/16"
}

variable "prod_public_subnet_cidr" {
  description = "CIDR block for the Prod public subnet"
  type        = string
  default     = "10.30.1.0/24"
}