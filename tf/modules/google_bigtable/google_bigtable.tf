locals {
  bindings_map = {
    for i, binding in var.iam_roles : i => binding
  }
}

resource "google_bigtable_instance" "this" {
  name = var.instance_name

  cluster {
    cluster_id   = var.cluster_id
    zone         = var.zone
    num_nodes    = var.num_nodes
    storage_type = var.storage_type
  }

  deletion_protection = var.instance_deletion_protection
}

resource "google_bigtable_table" "this" {
  name                = var.name
  instance_name       = google_bigtable_instance.this.name
  split_keys          = var.split_keys
  deletion_protection = var.deletion_protection


  dynamic "column_family" {
    for_each = var.column_family
    content {
      family = column_family.value.family
    }
  }

  change_stream_retention = var.change_stream_retention


  #Fixed values for automated_backup_policy
  dynamic "automated_backup_policy" {
    for_each = var.automated_backup_policy == "ENABLE" ? [1] : []
    content {
      retention_period = "72h0m0s"
      frequency        = "24h0m0s"
    }
  }
}

# ============== IAM BINDINGS ==================
resource "google_bigtable_table_iam_member" "binding" {
  for_each = local.bindings_map

  table    = google_bigtable_table.this.name
  instance = google_bigtable_instance.this.name
  role     = each.value.role
  member   = each.value.member
}