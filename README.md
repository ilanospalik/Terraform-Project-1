# Terraform-Project-1

The purpose of the project is to create a full Devops work environment with several tools
already integrated into an EC2 instance on AWS using Terraform AND Ansible.

Using Terraform
Create a VPC
Create 1 Public Subnet
Create Security group
Create Route table
Create Keypair
Create Internet Gateway
And connect all of them to an EC2.
On top of that add an event bridge that will turn on the EC2 at 7am and turn off at 7pm
adding an alert that will notify you when the EC2 is turn on and when it turned off
The alert is via SNS Topic.

Using Ansible
I Created an ansible Playbook that will install on the EC2 the CI/CD tool Jenkins on port 8080.
Showing that the Login page with the EC2 instance public ip address is sufficient.
I Installed on the same Ec2 docker engine.

ALL IN ONE CLICK VIA "TERRAFORM"
