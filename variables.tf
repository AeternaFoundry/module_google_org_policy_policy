variable "org_policy_policies" {
  description = <<EOT
Map of org_policy_policies, attributes below
Required:
    - name
    - parent
Optional:
    - deletion_policy
    - dry_run_spec (block):
        - inherit_from_parent (optional)
        - reset (optional)
        - rules (optional, block):
            - allow_all (optional)
            - condition (optional, block):
                - description (optional)
                - expression (optional)
                - location (optional)
                - title (optional)
            - deny_all (optional)
            - enforce (optional)
            - parameters (optional)
            - values (optional, block):
                - allowed_values (optional)
                - denied_values (optional)
    - spec (block):
        - inherit_from_parent (optional)
        - reset (optional)
        - rules (optional, block):
            - allow_all (optional)
            - condition (optional, block):
                - description (optional)
                - expression (optional)
                - location (optional)
                - title (optional)
            - deny_all (optional)
            - enforce (optional)
            - parameters (optional)
            - values (optional, block):
                - allowed_values (optional)
                - denied_values (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    name            = string
    parent          = string
    deletion_policy = optional(string)
    dry_run_spec = optional(object({
      inherit_from_parent = optional(bool)
      reset               = optional(bool)
      rules = optional(list(object({
        allow_all = optional(string)
        condition = optional(object({
          description = optional(string)
          expression  = optional(string)
          location    = optional(string)
          title       = optional(string)
        }))
        deny_all   = optional(string)
        enforce    = optional(string)
        parameters = optional(string)
        values = optional(object({
          allowed_values = optional(list(string))
          denied_values  = optional(list(string))
        }))
      })))
    }))
    spec = optional(object({
      inherit_from_parent = optional(bool)
      reset               = optional(bool)
      rules = optional(list(object({
        allow_all = optional(string)
        condition = optional(object({
          description = optional(string)
          expression  = optional(string)
          location    = optional(string)
          title       = optional(string)
        }))
        deny_all   = optional(string)
        enforce    = optional(string)
        parameters = optional(string)
        values = optional(object({
          allowed_values = optional(list(string))
          denied_values  = optional(list(string))
        }))
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.org_policy_policies : (
        v.dry_run_spec == null || (v.dry_run_spec.rules == null || alltrue([for item in v.dry_run_spec.rules : (item.parameters == null || (can(jsondecode(item.parameters))))]))
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.org_policy_policies : (
        v.spec == null || (v.spec.rules == null || alltrue([for item in v.spec.rules : (item.parameters == null || (can(jsondecode(item.parameters))))]))
      )
    ])
    error_message = "must be valid JSON"
  }
}

