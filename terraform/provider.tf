provider "aws" {
  region     = var.aws_region
# access_key = var.aws_access_key
# secret_key = var.aws_secret_key
}

# This stays fixed for Lambda@Edge deployment
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
