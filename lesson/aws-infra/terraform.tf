/* terraform block is used to define the required providers and versions */

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.52.0"
    }
  }

  backend "s3" {
    bucket         = "fking-state-lock"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile   = true
    #dynamodb_table = "fking-state-lock"
  }
}