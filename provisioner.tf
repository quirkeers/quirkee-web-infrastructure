resource "aws_s3_bucket_object" "test" {
  for_each = fileset("${path.module}/../../../build", "**")
  bucket = aws_s3_bucket.b.id
  key = each.value
  source = "./${path.module}/../../../build/${each.value}"
  etag = filemd5("./${path.module}/../../../build/${each.value}")
}
