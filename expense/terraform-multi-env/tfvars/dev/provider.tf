terraform {

  required_providers {

    aws = {

      source = "hashicorp/aws"

      version = "5.66.0"

    }

  }
  backend "s3" {

  }

}


# Configure the AWS Provider
provider "aws" {

  region = "ap-south-2"

}