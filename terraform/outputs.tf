output "lambda_edge_arn" {
  value       = aws_lambda_function.cloudfront_lambda.arn
  description = "ARN of the Lambda@Edge function deployed in us-east-1"
}

output "cloudfront_domain" {
  value       = aws_cloudfront_distribution.my_cf.domain_name
  description = "Domain name of the CloudFront distribution for Lambda@Edge testing"
}
