output "org_policy_policies_id" {
  description = "Map of id values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no id are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "org_policy_policies_deletion_policy" {
  description = "Map of deletion_policy values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no deletion_policy are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "org_policy_policies_dry_run_spec" {
  description = "Map of dry_run_spec values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no dry_run_spec are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => one(v.dry_run_spec) if v.dry_run_spec != null && length(v.dry_run_spec) > 0 }
}
output "org_policy_policies_etag" {
  description = "Map of etag values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no etag are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "org_policy_policies_name" {
  description = "Map of name values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no name are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "org_policy_policies_parent" {
  description = "Map of parent values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no parent are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "org_policy_policies_spec" {
  description = "Map of spec values across all org_policy_policies, keyed the same as var.org_policy_policies except keys with no spec are omitted"
  value       = { for k, v in google_org_policy_policy.org_policy_policies : k => one(v.spec) if v.spec != null && length(v.spec) > 0 }
}

