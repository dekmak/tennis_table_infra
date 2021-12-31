#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------

provider "aws" {
  region              = "${var.global_region}"
  allowed_account_ids = flatten([var.allowed_account_ids])
}

terraform {
  backend "s3" {
    bucket         = "tennisapp-terraform-state"
    key            = "us-east-2/workspace.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "tennisapp-terraform-state"
  }

  required_version = "= 1.0.0"
}


data "aws_caller_identity" "current" {}

