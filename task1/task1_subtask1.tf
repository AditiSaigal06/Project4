terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.61.0"
    }
  }

  backend "s3" {
    bucket = "upgrad-archana"
    key    = "Project4"
    region = "us-east-1"
  }
}

provider "aws" {
  # Configuration options
region ="us-east-1"
}
