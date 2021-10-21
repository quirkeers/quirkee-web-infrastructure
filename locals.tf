locals {
  domain_name = "quirkee.net"
  s3_origin_id = "quirkee-admin-portal"
  subdomain = lookup(var.subdomain_map, var.env)
  website_bucket_name = "quirkee-${var.env}-${var.name}-web-static"
}
