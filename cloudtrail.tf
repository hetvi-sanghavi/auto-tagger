resource "aws_cloudtrail" "cdi_splunk_cloudtrail" {
  depends_on                    = [aws_s3_bucket_policy.s3_bucket_policy]
  name                          = var.cloudtrail_name
  s3_bucket_name                = aws_s3_bucket.s3_bucket_cloud_trail.id
  enable_log_file_validation    = true
  include_global_service_events = true
  is_multi_region_trail         = false
}