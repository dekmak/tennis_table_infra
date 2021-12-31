#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "main_route_table_id" {
  value = "${module.vpc.vpc_main_route_table_id}"
}
output "cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "private_route_table_ids" {
  value = "${module.vpc.private_route_table_ids}"
}

output "public_route_table_ids" {
  value = "${module.vpc.public_route_table_ids}"
}

output "private_subnets_cidr_blocks" {
  value = "${module.vpc.private_subnets_cidr_blocks}"
}

output "public_subnets_cidr_blocks" {
  value = "${module.vpc.public_subnets_cidr_blocks}"
}

output "vpc_public_subnets" {
  value = "${module.vpc.public_subnets}"
}

output "vpc_private_subnets" {
  value = "${module.vpc.private_subnets}"
}
