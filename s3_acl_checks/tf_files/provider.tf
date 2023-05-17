terraform {
  cloud {
    organization = "sentinel-test" # enter tf enterprise org name here

    workspaces {
      name = "tf_sentinel_repo-s3_acl_check" # enter tf workspace name here
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
