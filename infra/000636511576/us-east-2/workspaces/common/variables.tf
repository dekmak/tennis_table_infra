#--------------------------------------------------------------
# Global Variables
#--------------------------------------------------------------

variable "global_region" {}
variable "project" {
    type    = string
}

variable "allowed_account_ids" {
    type    = list 
}

variable "environment" {
    type    = string
}

variable "resource_prefix" {
    type    = string
}

