terraform {

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "5.92.0"

    }

  }
  backend "s3" {

    bucket         = "ram-remote-state-dev"
    key            = "remote-state-dev-rds-mod"
    region         = "ap-south-2"
    dynamodb_table = "ram-locking-dev"

  }

}


# Configure the AWS Provider

provider "aws" {

  region = "ap-south-2"

}