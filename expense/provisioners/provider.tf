terraform {

 required_providers {

   aws = {

     source  = "hashicorp/aws"

     version = "5.50.0"

   }

 }

}

# Configure the AWS Provider
provider "aws" {

  region = "ap-south-2"
  
}