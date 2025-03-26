# Defines the output specific to 'aws-s3-static-website-bucket' module.`
# Makes the following output available to anything that calls this module

output "arn" {
  description = "ARN of the bucket."
  value = aws_s3_bucket.static_website.arn
}

output "name" {
  description = "Name(id) of the bucket."
  value = aws_s3_bucket.static_website.id
}

output "domain_name" {
  description = "Domain name of the bucket."
  value = aws_s3_bucket_website_configuration.static_website.website_domain
}