resource "google_org_policy_policy" "org_policy_policies" {
  for_each = var.org_policy_policies

  name            = each.value.name
  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy

  dynamic "dry_run_spec" {
    for_each = each.value.dry_run_spec != null ? [each.value.dry_run_spec] : []
    content {
      inherit_from_parent = dry_run_spec.value.inherit_from_parent
      reset               = dry_run_spec.value.reset
      dynamic "rules" {
        for_each = dry_run_spec.value.rules != null ? dry_run_spec.value.rules : []
        content {
          allow_all = rules.value.allow_all
          dynamic "condition" {
            for_each = rules.value.condition != null ? [rules.value.condition] : []
            content {
              description = condition.value.description
              expression  = condition.value.expression
              location    = condition.value.location
              title       = condition.value.title
            }
          }
          deny_all   = rules.value.deny_all
          enforce    = rules.value.enforce
          parameters = rules.value.parameters
          dynamic "values" {
            for_each = rules.value.values != null ? [rules.value.values] : []
            content {
              allowed_values = values.value.allowed_values
              denied_values  = values.value.denied_values
            }
          }
        }
      }
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? [each.value.spec] : []
    content {
      inherit_from_parent = spec.value.inherit_from_parent
      reset               = spec.value.reset
      dynamic "rules" {
        for_each = spec.value.rules != null ? spec.value.rules : []
        content {
          allow_all = rules.value.allow_all
          dynamic "condition" {
            for_each = rules.value.condition != null ? [rules.value.condition] : []
            content {
              description = condition.value.description
              expression  = condition.value.expression
              location    = condition.value.location
              title       = condition.value.title
            }
          }
          deny_all   = rules.value.deny_all
          enforce    = rules.value.enforce
          parameters = rules.value.parameters
          dynamic "values" {
            for_each = rules.value.values != null ? [rules.value.values] : []
            content {
              allowed_values = values.value.allowed_values
              denied_values  = values.value.denied_values
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

