variable "bucket_name" {
  description = "Name of s3 bucket, must be globally unique."
  type = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type = map(string)
  default = {}
}