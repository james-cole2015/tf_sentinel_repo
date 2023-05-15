terraform {
  cloud {
    organization = "sentinel-tests"

    workspaces {
      name = "glowing-parakeet"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}




provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      environment = "development"
      platform    = "terraform"
      repo-name   = "sentinel-access-keys"
      user        = "DougReeves"
    }
  }
}
