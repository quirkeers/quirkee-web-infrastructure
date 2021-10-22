resource "aws_s3_bucket_object" "test" {
  for_each = fileset("${path.module}/../../../build", "**")
  bucket = aws_s3_bucket.b.id
  key = each.value
  source = "./${path.module}/../../../build/${each.value}"
  etag = filemd5("./${path.module}/../../../build/${each.value}")
}

resource "aws_s3_bucket_object" "test" {
  for_each = fileset("${path.module}/../../../build/static/css", "**")
  bucket = aws_s3_bucket.b.id
  key = "static/css/${each.value}"
  source = "./${path.module}/../../../build/static/css/${each.value}"
  etag = filemd5("./${path.module}/../../../build/static/css/${each.value}")
}

resource "aws_s3_bucket_object" "test" {
  for_each = fileset("${path.module}/../../../build/static/js", "**")
  bucket = aws_s3_bucket.b.id
  key = "static/js/${each.value}"
  source = "./${path.module}/../../../build/static/js/${each.value}"
  etag = filemd5("./${path.module}/../../../build/static/js/${each.value}")
}
