# The output block is used to declare values that are accessible outside the Terraform configuration
output "ec2_instance_publicip" {
  description = "EC2 Instance Public IP"
  value       = aws_instance.jenkins_server.public_ip
}