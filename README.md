# Static S3 Website Provisioning with Terraform

This project provisions a static website hosted on an AWS S3 bucket using Terraform. The website includes an index page, an error page, and a redirect rule for documents.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html) (version >= 1.2.0)
- AWS CLI configured with appropriate credentials and permissions
- An AWS account

## Project Structure

```text
. 
├── main.tf             # Root Terraform configuration 
├── variables.tf        # Input variables for the root module 
├── outputs.tf          # Outputs for the root module 
├── modules/ 
│ └── aws-s3-static-website-bucket/ 
│ ├── main.tf           # S3 bucket module configuration 
│ ├── variables.tf      # Input variables for the module 
│ ├── outputs.tf        # Outputs for the module 
│ ├── www/              # Website files 
│ │ ├── index.html      # Default index page 
│ │ └── error.html      # Error page 
│ └── documents/ 
│ └── index.html        # Redirect target for documents
```

## Steps to Provision the Static Website

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone https://github.com/div-ops123/Static-S3-Website-Provisioning-with-Terraform.git
   cd Static-S3-Website-Provisioning-with-Terraform
   ```

2. **Initialize Terraform**

Initialize the Terraform working directory to download the required providers and modules:
First change the region name in `variables.tf` with your aws region name.

```bash
terraform init
```

3. **Review the Plan**

Generate and review the execution plan to understand the resources that will be created:

```bash
terraform plan
```

4. **Apply the Configuration**

Apply the Terraform configuration to provision the resources:

```bash
terraform apply
```
Confirm the prompt by typing `yes`.

5. **Access the Website**

After the provisioning is complete, Terraform will output the following details:

- **Bucket ARN**: The Amazon Resource Name of the S3 bucket.
- **Bucket Name**: The name of the S3 bucket.
- **Bucket Domain**: The domain name to access the static website.

Use the `website_bucket_domain` output to access your static website in a browser.


## Cleaning Up
To destroy the resources created by this configuration, run:

```bash
terraform destroy
```

Confirm the prompt by typing `yes`.

### Notes
- Ensure the bucket name specified in main.tf is globally unique.
- The S3 bucket is configured to allow public access for website hosting. Be cautious about exposing sensitive data.
