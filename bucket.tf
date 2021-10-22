resource "aws_s3_bucket" "b" {
  bucket = local.website_bucket_name
  acl    = "public-read"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[{
        "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
          "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${local.website_bucket_name}/*"]
    }
  ]
}
EOF

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/../../../build s3://${aws_s3_bucket.b.id}"
  }
}
