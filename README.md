
# Tennis Table Scoring Application > Infrastructure

This project is using Terraform to automate the creation of common infrastructure on AWS for the Tennis Table Scoring application.
It generates the following resources:
- S3 bucket for Terraform State files
- VPC and its related subnets, security group and NAT
- Aurora database (Postgresql) with secret password saved on Secret Manager

In order to execute the terraform scripts, ensure you have Terraform installed in your machine, and please follow the insttructions below:
- Clone the code into your local machine
- Create an AWS credentials profile named "tennisapp" (file sould be located at %USERPROFILE%/.aws/credentials)
- Ensure using the created AWS credentials: export AWS_PROFILE=tennisapp
- Switch directory to the folder ~/tennis_table_infra/infra/{AWS_ACCOUNT_ID}/{AWS_REGION}/bootstrap
- call: terraform init
- call: terraform plan
- call: terraform apply
- Switch directory to the folder ~/tennis_table_infra/infra/{AWS_ACCOUNT_ID}/{AWS_REGION}/workspaces/common
- call: terraform plan -var-file vars/nonprod.workspace-tfvars
- call: terraform apply -var-file vars/nonprod.workspace-tfvars


Note: AWS_ACCOUNT_ID should be set to your AWS account id (i.e: 000636511576). AWS_REGION should be set to your AWS region (i.e: us-east-2)