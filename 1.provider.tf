terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
  backend "s3" {
    bucket = "prav-terraform-tfstate"
    key    = "prav-terraformt.fstate"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
}