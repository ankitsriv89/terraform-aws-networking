# SQS Queue
resource "aws_sqs_queue" "sqs" {
  name                      = "sqs-service"
  visibility_timeout_seconds = 30  # Adjust as necessary
  message_retention_seconds  = 86400 # Adjust as necessary
  delay_seconds              = 0    # Adjust as necessary
  max_message_size           = 262144  # Adjust as necessary
  receive_wait_time_seconds  = 0    # Adjust as necessary

  tags = {
    Name = "sqs-service"
  }
}