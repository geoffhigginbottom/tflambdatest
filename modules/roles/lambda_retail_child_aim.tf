resource "aws_iam_role" "lambda_retail_child_role" {
  name_prefix = "lambda_retail_child_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

output "lambda_retail_child_role_arn" {
  value = aws_iam_role.lambda_retail_child_role.arn
}

resource "aws_iam_policy" "lambda_retail_child_policy" {
  name_prefix        = "lambda_retail_child_policy"
  description = "Policy used by the Lambda Retail child Role for Splunk APM Demo"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction",
                "lambda:InvokeAsync"
            ],
            "Resource": "arn:aws:lambda:*:*:function:*"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "child_attach" {
  role       = aws_iam_role.lambda_retail_child_role.name
  policy_arn = aws_iam_policy.lambda_retail_child_policy.arn
}
