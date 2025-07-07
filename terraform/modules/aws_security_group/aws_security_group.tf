resource "aws_security_group" "this" {
  name                   = var.name
  description            = var.description
  vpc_id                 = var.vpc_id
  revoke_rules_on_delete = var.revoke_rules_on_delete
  dynamic "timeouts" {
    for_each = var.timeouts != null ? [var.timeouts] : []
    content {
      create = lookup(timeouts.value, "create", null)
      delete = lookup(timeouts.value, "delete", null)
    }
  }
  dynamic "egress" {
    for_each = var.egress
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      cidr_blocks      = egress.value.cidr_blocks
      description      = egress.value.description
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
      prefix_list_ids  = egress.value.prefix_list_ids
      protocol         = egress.value.protocol
      security_groups  = egress.value.security_groups
      self             = egress.value.self
    }
  }

  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      description      = ingress.value.description
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
      prefix_list_ids  = ingress.value.prefix_list_ids
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
    }
  }

  tags = var.tags
}
