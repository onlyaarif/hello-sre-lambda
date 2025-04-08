# ☁️ Lambda@Edge with Terraform – hello-sre-lambda

This project demonstrates deploying an AWS Lambda function with **Terraform**, and associating it with **Amazon CloudFront** as a **Lambda@Edge** function.

## 🔧 Technologies Used

- **Terraform** – Infrastructure as Code
- **AWS Lambda** – Serverless compute
- **Lambda@Edge** – Globally replicated function
- **Amazon CloudFront** – CDN to trigger the Lambda
- **Git + GitHub** – Version control

## 📂 Project Structure

hello-sre-lambda/ ├── lambda/ │ └── lambda_function.py # Your Lambda handler ├── main.tf # Terraform config ├── provider.tf # AWS provider setup ├── .gitignore ├── README.md

## 🚀 How to Deploy

### Prerequisites
- AWS CLI configured (`aws configure`)
- Terraform installed
- Access keys securely set (via `~/.aws/credentials`)

### Deployment Steps

```bash
terraform init
terraform plan
terraform apply

After apply, visit your CloudFront domain and view the live Lambda response!

🛡️ Security Note
✅ No AWS credentials are hardcoded.
🚫 GitHub Push Protection is enabled to block secret leaks.

📦 Future Enhancements
Split Lambda logic into separate handlers

Add CI/CD (GitHub Actions / Jenkins)

Add logging with AWS CloudWatch

Add input/output variables

Feel free to fork, improve, or use this structure for your own Lambda projects!

👨‍💻 Created by Arif
Proudly learning DevOps the right way


---

## ✅ What You Can Do:

1. Copy this into your `README.md`
2. Tweak any parts (like description, your GitHub name, etc.)
3. Commit & push:

```bash
git add README.md
git commit -m "Update README with full project info"
git push
