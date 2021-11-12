resource "aws_s3_bucket" "b" {
  bucket = local.website_bucket_name
  acl    = "private"

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
