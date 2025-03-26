# output "instance_id" {
#     description = "ID of the EC2 instance"
#     value = aws_instance.app_server.id
# }

# output "instance_public_ip" {
#     description = "Public IP address of the EC2 instances"
#     value = aws_instance.app_server.public_ip
# }

# References the output from the 'aws-s3-static-website-bucket' module(alias = website_s3_bucket from root main.tf), 
# and exposes it at the root level, here.

output "website_bucket_arn" {
  description = "ARN of the s3 static website."
  value = module.website_s3_bucket.arn
}

output "website_bucket_name" {
  description = "Name (id) of the bucket"
  value = module.website_s3_bucket.name
}

output "website_bucket_domain" {
  description = "Domain name of the bucket"
  value       = module.website_s3_bucket.domain_name
}