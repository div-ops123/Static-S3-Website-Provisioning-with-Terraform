# We do not specify provider block here, because Terraform uses the parent folder provider block to run modelues

resource "aws_s3_bucket" "static_website" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/index.html"
    }
  }
}

resource "aws_s3_bucket_policy" "static_website_bucket_policy" {
    bucket = aws_s3_bucket.static_website.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Principal = "*"
                Action = "s3:GetObject"
                Resource = "${aws_s3_bucket.static_website.arn}/*"
            }
        ]
    })

    depends_on = [ aws_s3_bucket_public_access_block.static_website_public_policy ]
}

resource "aws_s3_bucket_public_access_block" "static_website_public_policy" {
  bucket = aws_s3_bucket.static_website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


