locals {
  master_password = "${random_password.master_password.result}"
}

resource "random_password" "master_password" {
  length  = 16
  special = false
}

resource "aws_secretsmanager_secret" "rds_database" {
  name = var.database_secret_name
}

resource "aws_secretsmanager_secret_version" "rds_database_password" {
  secret_id     = "${aws_secretsmanager_secret.rds_database.id}"
  secret_string = "${local.master_password}"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = flatten([var.subnet_ids])
}

resource "aws_rds_cluster_instance" "rds_cluster_instances" {
  identifier         = var.cluster_instance_identifier
  cluster_identifier = aws_rds_cluster.rds_cluster.id
  instance_class     = var.instance_class
  publicly_accessible = var.instance_public_access
  engine = aws_rds_cluster.rds_cluster.engine
}

resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier = var.cluster_identifier
  availability_zones = flatten([var.vpc_azs])
  database_name      = var.database_name
  master_username    = var.database_username
  master_password    = local.master_password

  engine               = "aurora-postgresql"
  engine_mode          = "provisioned"
  engine_version       = var.cluster_engine_version
  allow_major_version_upgrade = true
  apply_immediately    = true
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  storage_encrypted    = true

  preferred_backup_window      = "20:00-22:00"
  preferred_maintenance_window = "thu:10:00-thu:12:00"
  backup_retention_period      = "1"
  vpc_security_group_ids    = [aws_security_group.rds_aurora_sg.id]
  skip_final_snapshot          = "true"
  
  tags = merge(
    {
      Terraform   = "true"
    }, 
    var.tags
  )
}

resource "aws_security_group" "rds_aurora_sg" {
  name        = var.rds_sg_name
  vpc_id      = var.vpc_id
  description = "Access from self"

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      Terraform   = "true"
    }, 
    var.tags
  )
}

resource "aws_security_group_rule" "rds_aurora_sg_rule_5432" {
  from_port         = var.database_port
  to_port           = var.database_port
  protocol          = "tcp"
  type              = "ingress"
  security_group_id = aws_security_group.rds_aurora_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "public access"

}