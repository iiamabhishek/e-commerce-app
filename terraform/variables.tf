variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Name for the EKS cluster and VPC"
  type        = string
  default     = "eks-cluster"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "intra_subnets" {
  description = "Intra subnet CIDRs"
  type        = list(string)
  default     = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "tags" {
  description = "Global tags for resources"
  type        = map(string)
  default     = {
    example = "eks-cluster"
  }
}

variable "instance_type" {
  description = "Instance type for the EC2 instance and EKS nodes"
  default     = "t2.medium"
}

variable "environment" {
  description = "Environment tag"
  default     = "dev"
}

variable "disk_size" {
  description = "Disk size for EKS nodes"
  type        = number
  default     = 30
}