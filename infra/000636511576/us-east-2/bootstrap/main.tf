#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------

provider "aws" {
  region              = "${var.global_region}"
  allowed_account_ids = ["000636511576"]
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tennisapp-terraform-state"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-lock" {
   name = "tennisapp-terraform-state"
   hash_key = "LockID"
   read_capacity = 20
   write_capacity = 20

   attribute {
      name = "LockID"
      type = "S"
   }
}

resource "aws_dynamodb_table" "data-aggregation-dynamodb-terraform-lock" {
   name = "data-aggregation-tennisapp-terraform-state"
   hash_key = "LockID"
   read_capacity = 20
   write_capacity = 20

   attribute {
      name = "LockID"
      type = "S"
   }
}


data "aws_caller_identity" "current" {}