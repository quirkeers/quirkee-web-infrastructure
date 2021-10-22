//resource "aws_s3_bucket" "bucket_upload" {
//  provisioner "local-exec" {
//    command = "aws s3 sync ${path.module}/../../../build s3://${aws_s3_bucket.b.id}"
//  }
//}
