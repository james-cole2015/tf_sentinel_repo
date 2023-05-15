########## creating a PUBLIC bucket for cloudtrail ##########
resource "aws_s3_bucket" "cloudtrail_logs_bucket_public" {
  bucket = "my-cloudtrail-logs-bucket-09987643" # replace with the name of your S3 bucket
  acl    = "public-read"                        # setting the bucket ACL to public-read makes the bucket contents public

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_cloudtrail" "cloudtrail_public" {
  name                          = "public_cloudtrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs_bucket_public.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
}
########## creating a PRIVATE bucket for cloudtrail ##########
resource "aws_s3_bucket" "cloudtrail_logs_bucket_private" {
  bucket = "my-cloudtrail-logs-bucket-0987654" # replace with the name of your S3 bucket
  acl    = "private"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_cloudtrail" "cloudtrail_private" {
  name                          = "private_cloudtrail"
  s3_bucket_name                = aws_s3_bucket.cloudtrail_logs_bucket_private.id
  include_global_service_events = true
  is_multi_region_trail         = true
  enable_logging                = true
}
