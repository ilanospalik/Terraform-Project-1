# Terraform-Project-1

The purpose of this project is to create a "full Devops" work environment with several tools
that are already integrated into an EC2 instance on AWS, using Terraform AND Ansible.

Using Terraform:

Created a VPC

Created 1 Public Subnet

Created Security group

Created Route table

Created Keypair

Created Internet Gateway

All are connected to the EC2.

On top of that add an event bridge that will turn on the EC2 at 7am and turn off at 7pm,

Alert that will notify you when the EC2 is turn on and when it turned off, via SNS Topic.

Using Ansible:

Created a repository in my github that gonna diploy an ansible Playbook, the playbook will install on the EC2 the CI/CD tool Jenkins that listen on port 8080.
Showing that the Login page with in the EC2 instance public ip address is sufficient.
Plus Installing on the same Ec2 a docker engine.

ALL IN ONE CLICK VIA "TERRAFORM" & "ANSIBLE"
