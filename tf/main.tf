module "stackgen_3032d5a0-efb7-4a8e-bb08-4e53f9eab8ea" {
  source                       = "./modules/google_bigtable"
  automated_backup_policy      = "DISABLE"
  change_stream_retention      = null
  cluster_id                   = "hello"
  column_family                = []
  deletion_protection          = "PROTECTED"
  iam_roles                    = []
  instance_deletion_protection = true
  instance_name                = "hello"
  name                         = "hello"
  num_nodes                    = null
  project_id                   = var.project_id
  split_keys                   = []
  storage_type                 = "SSD"
  zone                         = null
}

