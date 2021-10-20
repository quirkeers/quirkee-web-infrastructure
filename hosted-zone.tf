variable "subdomain_map" {
  default = {
    "production": "",
    "development": "dev-"
  }
}

data "aws_route53_zone" "this" {
  name = local.domain_name
}

resource "aws_route53_record" "main-a-record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name = "${local.subdomain}${var.name}"
  type = "A"
  alias {
    name = aws_s3_bucket.website.website_domain
    zone_id = aws_s3_bucket.website.hosted_zone_id
    evaluate_target_health = false
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  domain_name               = local.domain_name
  zone_id                   = data.aws_route53_zone.this.id
  subject_alternative_names = ["${local.subdomain}${var.name}.${local.domain_name}"]
}
