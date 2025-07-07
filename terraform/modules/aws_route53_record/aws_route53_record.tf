resource "aws_route53_record" "this" {
  zone_id                          = var.zone_id
  name                             = var.name
  type                             = var.type
  ttl                              = length(var.alias) == 0 ? var.ttl : null
  records                          = length(var.records) == 0 ? null : var.records
  set_identifier                   = var.set_identifier
  allow_overwrite                  = var.allow_overwrite
  health_check_id                  = var.health_check_id
  multivalue_answer_routing_policy = var.multivalue_answer_routing_policy

  dynamic "alias" {
    # if var.records is not empty, then alias is not needed
    for_each = length(var.records) == 0 ? var.alias : []
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = var.multivalue_answer_routing_policy != null || var.multivalue_answer_routing_policy != false ? [] : var.geolocation_routing_policy
    content {
      continent   = geolocation_routing_policy.value.continent
      country     = geolocation_routing_policy.value.country
      subdivision = geolocation_routing_policy.value.subdivision
    }
  }
}

