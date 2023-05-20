terraform {
  cloud {
    organization = "sentinel-test" # enter your terraform cloud organization name

    workspaces {
      name = "unrestricted-ssh-check" # enter your terraform cloud workspace
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
      repo-name   = "sentinel-terraform-repo"
      user        = "MatthewDavis"
    }
  }
}
