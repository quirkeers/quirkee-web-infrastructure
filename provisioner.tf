resource "null_resource" "remove_and_upload_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/../../../build s3://${aws_s3_bucket.b.id}"
  }
}
