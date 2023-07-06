# Create SNS Topic
resource "aws_sns_topic" "ec2_state_change" {
  name = "ec2_state_change"
}

# Create Subscription 
resource "aws_sns_topic_subscription" "ec2_state_subscription" {
  topic_arn = aws_sns_topic.ec2_state_change.arn
  protocol  = "email"
  endpoint  = "ilanospalik@gmail.com"
}

