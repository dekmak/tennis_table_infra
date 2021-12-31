
#--------------------------------------------------------------
# RDS
#--------------------------------------------------------------


output "aurora_azs" {
  value = "${aws_rds_cluster.rds_cluster.*.availability_zones}"
}

output "aurora_cluster_instances" {
  value = "${aws_rds_cluster_instance.rds_cluster_instances.*.availability_zone}"
}