Hello SRE Lambda@Edge - Terraform Project
✅ Deployed via Terraform | AWS Lambda@Edge + CloudFront | Python | Infrastructure-as-Code

📌 Overview
This project demonstrates a complete hands-on setup to:

Deploy a Python-based AWS Lambda@Edge function

Triggered via CloudFront distribution

Using fully automated Terraform infrastructure

With a custom HTML response

IAM roles, Lambda permissions, and edge configurations defined cleanly

Zipped, structured, and pushed via GitHub

Built by Arif with deep love and late-night persistence 💪✨

📂 Folder Structure

hello-sre-lambda/
│
├── .gitignore
├── README.md
│
├── lambda/
│   ├── lambda_function.py         # Python Lambda function code
│   └── lambda_function.zip        # Zipped package for deployment
│
├── terraform/
│   ├── main.tf                    # All Terraform resources
│   ├── provider.tf                # AWS provider setup
│   ├── variables.tf               # Declared variables
│   ├── outputs.tf                 # Final ARN & Domain outputs
│   ├── dev.tfvars                 # Contains AWS keys (gitignored)
│   └── terraform.tfstate*         # State files (auto-managed)


🚀 Deploy Instructions
Make sure AWS CLI & Terraform are configured. Then run:

cd terraform
terraform init
terraform apply -var-file="dev.tfvars"

📦 Outputs
After apply, you’ll get:

✅ Lambda@Edge function ARN

🌐 CloudFront Domain URL

🧪 Test the Setup

Visit the CloudFront domain in the browser:
https://your-cloudfront-domain.cloudfront.net

You should see:
✅ Hello from Arif's Lambda@Edge function!

🔐 Security Notes
dev.tfvars contains access keys → should be .gitignored

lambda_function.zip is also ignored → zipped locally before apply

🧠 Learning Outcomes
Real-world Terraform practice (apply, plan, state management)

CloudFront and Lambda@Edge integration

IAM role & policy setup

Debugging AWS edge errors and conflict resolution

Folder refactoring & GitHub best practices
