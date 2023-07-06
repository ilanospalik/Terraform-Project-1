# Terraform-Project-1

The purpose of the project is to create a full Devops work environment with several tools
already integrated into an EC2 instance on AWS using Terraform AND Ansible.

Using Terraform

Created a VPC

Created 1 Public Subnet

Created Security group

Created Route table

Created Keypair

Created Internet Gateway

All are connected to the EC2.

On top of that add an event bridge that will turn on the EC2 at 7am and turn off at 7pm,

Alert that will notify you when the EC2 is turn on and when it turned off, via SNS Topic.

Using Ansible

I Created an ansible Playbook that will install on the EC2 the CI/CD tool Jenkins on port 8080.
Showing that the Login page with the EC2 instance public ip address is sufficient.
And Installed on the same Ec2 a docker engine.

ALL IN ONE CLICK VIA "TERRAFORM"
