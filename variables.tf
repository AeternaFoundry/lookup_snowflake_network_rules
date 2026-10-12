variable "network_rules_lookup" {
  description = <<EOT
Map of network_rules_lookup, attributes below
Optional:
    - like
    - starts_with
    - with_describe
    - in (block):
        - account (optional)
        - database (optional)
        - schema (optional)
    - limit (block):
        - from (optional)
        - rows (required)
EOT

  type = map(object({
    like          = optional(string)
    starts_with   = optional(string)
    with_describe = optional(bool)
    in = optional(object({
      account  = optional(bool)
      database = optional(string)
      schema   = optional(string)
    }))
    limit = optional(object({
      from = optional(string)
      rows = number
    }))
  }))
}

