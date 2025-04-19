 resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role_${var.environment}"

  assume_role_policy = jsonencode({
  Version = "2012-10-17"
  Statement = [
    {
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = [
          "lambda.amazonaws.com",
          "edgelambda.amazonaws.com"
        ]
      }
    }
  ]
})
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "hello_lambda" {
  function_name = "hello_sre_lambda_arif"
  runtime       = "python3.9"
  handler       = "lambda_function.handler"
  filename      = "${path.module}/../lambda/lambda_function.zip"

  source_code_hash = filebase64sha256("${path.module}/../lambda/lambda_function.zip")

  role = aws_iam_role.lambda_exec_role.arn
}

resource "aws_lambda_function" "cloudfront_lambda" {
  provider     = aws.virginia
  function_name = "cloudfront_lambda_arif"
  runtime       = "python3.9"
  handler       = "lambda_function.handler"
  filename      = "${path.module}/../lambda/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda/lambda_function.zip")
  role = aws_iam_role.lambda_exec_role.arn
  publish = true
}

resource "aws_cloudfront_distribution" "my_cf" {
  origin {
    domain_name = "example.com"
    origin_id   = "exampleOrigin"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "exampleOrigin"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"

    lambda_function_association {
      event_type   = "viewer-request"
      lambda_arn   = aws_lambda_function.cloudfront_lambda.qualified_arn
      include_body = false
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
