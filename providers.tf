terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "my-terraform-state-bucket-arjun12"
    key            = "terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
