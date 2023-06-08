resource "aws_route53_record" "NAME" {
  zone_id = var.hosted_zone_id
  name    = "NAME.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_elb.NAME_elb.dns_name
    zone_id                = aws_elb.NAME_elb.zone_id
    evaluate_target_health = true
  }
}