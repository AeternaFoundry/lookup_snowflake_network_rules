data "snowflake_network_rules" "network_rules_lookup" {
  for_each = var.network_rules_lookup

  like          = each.value.like
  starts_with   = each.value.starts_with
  with_describe = each.value.with_describe

  dynamic "in" {
    for_each = each.value.in != null ? [each.value.in] : []
    content {
      account  = in.value.account
      database = in.value.database
      schema   = in.value.schema
    }
  }

  dynamic "limit" {
    for_each = each.value.limit != null ? [each.value.limit] : []
    content {
      from = limit.value.from
      rows = limit.value.rows
    }
  }
}

