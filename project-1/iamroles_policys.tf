# IAM ROLE 
resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}


# attached aws ec2 policy is attached
resource "aws_iam_role_policy_attachment" "ec2full_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.jenkins_role.name
}


# attached aws ecr policy is attached
resource "aws_iam_role_policy_attachment" "ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.jenkins_role.name
}


# attached aws vpc policy is attached
resource "aws_iam_role_policy_attachment" "vpc_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  role       = aws_iam_role.jenkins_role.name
}


# attached aws iam policy is attached
resource "aws_iam_role_policy_attachment" "iam_policy" {
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
  role       = aws_iam_role.jenkins_role.name
}


resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "jenkins_instance_profile"
  role = aws_iam_role.jenkins_role.name
}

# Create an IAM policy for the Scheduler
resource "aws_iam_policy" "start_stop_policy" {
  name = "start_stop_policy"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "ec2Stop",
        "Effect" : "Allow",
        "Action" : [
          "ec2:StartInstances",
          "ec2:StopInstances"
        ],
        "Resource" : "*"
      }
    ]
  })
}

# Create an IAM role for the Scheduler
resource "aws_iam_role" "SchedulerEC2Start_Stop" {
  name = "SchedulerEC2Start_Stop"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "scheduler.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

# Attach the IAM policy to the IAM role for the Scheduler
resource "aws_iam_role_policy_attachment" "start_stop_policy" {
  role       = aws_iam_role.SchedulerEC2Start_Stop.name
  policy_arn = aws_iam_policy.start_stop_policy.arn
}


# Create an IAM role for the cloudwatch to the activate the SNS
resource "aws_iam_role" "cloudwatch_to_sns" { 
  name = "cloudwatch_to_sns"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "events.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
} 

# Create an IAM policy for the cloudwatch to the activate the SNS
resource "aws_iam_role_policy" "cloudwatch_to_sns" { # this new
  name = "cloudwatch_to_sns"
  role = aws_iam_role.cloudwatch_to_sns.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "sns:Publish"
        ],
        "Resource" : "${aws_sns_topic.ec2_state_change.arn}"
      }
    ]
  })
} 

# Attach the IAM policy to the IAM role for the cloudwatch
resource "aws_iam_role_policy_attachment" "cloudwatch_to_sns" {
  role       = aws_iam_role.cloudwatch_to_sns.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}