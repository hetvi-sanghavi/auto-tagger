resource "aws_s3_bucket" "s3_bucket_cloud_trail" {
  bucket        = "s3-bucket-cloudtrail-${data.aws_caller_identity.current.account_id}"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket_cloud_trail.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}