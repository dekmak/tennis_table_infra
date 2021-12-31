module "rds_auora-postgres" {
  source                        = "../../modules/rds-auora-postgres"
  global_region                 = var.global_region
  allowed_account_ids           = var.allowed_account_ids

  database_secret_name          = "${var.resource_prefix}-platform-database"
  subnet_group_name             = "${var.resource_prefix}-subnet-group"
  subnet_ids                    = module.vpc.public_subnets
  cluster_instance_identifier   = "${var.resource_prefix}-auora-cluster"
  cluster_engine_version        = 13.4
  instance_class                = "db.t4g.medium"
  instance_public_access        = true
  cluster_identifier            = "${var.resource_prefix}-aurora-postgres"
  database_name                 = "platform"
  database_username             = "platform_admin"
  database_port                 = 5432
  rds_sg_name                   = "${var.resource_prefix}-rds-aurora-sg"
  vpc_azs                       = module.vpc.azs
  vpc_id                        = module.vpc.vpc_id
  tags   = {
    "Environment" = var.environment,
    "Project" = var.project
  }
}