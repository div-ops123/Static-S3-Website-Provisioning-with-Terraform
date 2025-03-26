terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# Plugin that Terraform uses to create and manage your resources
provider "aws" {
  region = "af-south-1"
}

# # Define components of your infrastructure
# resource "aws_instance" "app_server" {
#   ami           = "ami-002c34f0ce319f0ad"
#   instance_type = "t3.micro"

#   tags = {
#     # References instance_name variable defined in variables.tf
#     Name = var.instance_name
#   }
# }

# Instantiate module
# website_s3_bucket: Is the reference name i gave to 'aws-s3-static-website-bucket' module
module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "divine-static-website-terraform-example"

  tags = {
    Terraform = "true"
    Environment = "Dev"
  }
}
