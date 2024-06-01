# IAM Role
resource "aws_iam_role" "sqs_role" {
  name = "sqs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAM Policy for SQS Access
resource "aws_iam_policy" "sqs_policy" {
  name        = "sqs-policy"
  description = "Policy to allow access to SQS"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes",
          "sqs:GetQueueUrl"
        ],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

# Attach Policy to IAM Role
resource "aws_iam_role_policy_attachment" "sqs_role_policy_attachment" {
  role       = aws_iam_role.sqs_role.name
  policy_arn = aws_iam_policy.sqs_policy.arn
}

# IAM Instance Profile
resource "aws_iam_instance_profile" "sqs_instance_profile" {
  name = "sqs-instance-profile"
  role = aws_iam_role.sqs_role.name
}