terraform {
  backend "s3" {
    bucket = "762233757924-terraform-state"
    key    = "e-commerce-app/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}