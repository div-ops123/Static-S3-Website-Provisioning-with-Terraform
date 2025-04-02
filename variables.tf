variable "instance_name" {
    description = "Value of the name tag for the EC2 instance"
    type = string
    default = "ExampleAppServer"
}

variable "region" {
    description = "AWS region where you want to host the s3 bucket"
    type = string
    default = "af-south-1"
}