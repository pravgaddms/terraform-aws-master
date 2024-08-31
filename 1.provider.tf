terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.65.0"
    }
  }
  backend "s3" {
    bucket         = "prav-terraform-tfstate"
    key            = "prav-terraformt.fstate"
    region         = "us-east-1"
    # enable below option for dynamodb state locking
    # dynamodb_table = "terraform-state-lock-dynamo"
    # encrypt        = true
  }
}

provider "aws" {
  # Configuration options
}