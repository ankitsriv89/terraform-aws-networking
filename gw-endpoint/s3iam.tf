# Define an IAM role
resource "aws_iam_role" "ec2_s3_access" {
  name = "ec2_s3_access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Define an IAM policy
resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_access_policy"
  description = "Policy to allow access to S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["s3:ListBucket",
                    "s3:GetObject",
                    "s3:PutObject"]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  role       = aws_iam_role.ec2_s3_access.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

# Create an instance profile
resource "aws_iam_instance_profile" "ec2_s3_access_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_s3_access.name
}
