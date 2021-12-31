variable "global_region" {
    type = string
}

variable "allowed_account_ids" {
    type = list
}

variable "tags" {
    type = map
}

variable "database_secret_name" {
    type    = string
}

variable "subnet_group_name" {
    type    = string
}

variable "subnet_ids" {
    type    = list
}

variable "cluster_instance_identifier" {
    type    = string
}

variable "cluster_engine_version" {
    type    = number
}

variable "instance_class" {
    type    = string
}

variable "instance_public_access" {
    type    = bool
}

variable "cluster_identifier" {
    type    = string 
}

variable "database_name" {
    type    = string
}

variable "database_username" {
    type    = string
}

variable "database_port" {
    type    = number
}

variable "rds_sg_name" {
    type    = string
}

variable "vpc_azs" {
    type    = list
}

variable "vpc_id" {
    type    = string
}