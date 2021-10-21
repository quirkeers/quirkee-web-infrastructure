data "aws_route53_zone" "this" {
  name = local.domain_name
}

resource "aws_route53_record" "main-a-record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name = "${local.subdomain}${var.name}"
  type = "A"
  alias {
    name = aws_s3_bucket.b.website_domain
    zone_id = aws_s3_bucket.b.hosted_zone_id
    evaluate_target_health = false
  }
}

# CloudFront supports US East (N. Virginia) Region only.
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 3.0"

  providers = {
    aws = aws.us-east-1
  }

  domain_name               = local.domain_name
  zone_id                   = data.aws_route53_zone.this.id
  subject_alternative_names = ["${local.subdomain}${var.name}.${local.domain_name}"]
}
