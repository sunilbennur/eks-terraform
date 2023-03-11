terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57"
    }
  }

  #terrafrom remote state block with s3

  backend "s3" {
    bucket         = "terraform-state-bucket81"
    key            = "terraform.tfstate"
    dynamodb_table = "state-locking"
    region         = "us-east-1"
  }
}

# provider block to configure aws 

provider "aws" {
  region = "us-east-1"
}


