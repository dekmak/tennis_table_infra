#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------

provider "aws" {
  region              = var.global_region
  allowed_account_ids = flatten([var.allowed_account_ids])
}

data "aws_caller_identity" "current" {}

