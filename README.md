# 🚀 AWS Infrastructure Deployment with Terraform

This project is a practical demonstration of Infrastructure as Code (IaC) using Terraform to provision a secure, scalable, and highly available AWS environment.

The configuration showcases:

* A custom Virtual Private Cloud (VPC)

* Three subnets across different Availability Zones for fault tolerance

* A dedicated network interface with a static private IP

* A t3.micro EC2 instance connected to the network interface

* A remote S3 backend for centralized Terraform state management

## 📌 Project Architecture

The infrastructure is designed with modularity and resilience in mind:

* VPC (10.0.0.0/16) provides an isolated network environment

* Three subnets (10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24), each in a different Availability Zone (eu-north-1a, eu-north-1b, eu-north-1c)

* EC2 instance deployed in one subnet with a custom network interface and static private IP (10.0.1.20)

* Terraform state stored in an S3 bucket, with state locking enabled to prevent conflicts

<img width="1115" height="1112" alt="aws_architecture_-_paolo" src="https://github.com/user-attachments/assets/79d6b5e8-aa4d-41ea-9b91-2afde8815625" />

# ⚙️ Key Components & Configuration
## 1. Remote State with S3 Backend

Terraform uses a remote backend (S3 bucket) to store the terraform.tfstate file, ensuring consistency and collaboration.

Why this matters:

* Collaboration → Multiple users work on the same state safely

* Security → Remote and versioned storage avoids local file corruption/loss

* Locking → Prevents simultaneous terraform apply executions

## 2. AWS Provider

Terraform is configured to use AWS as the provider in the eu-north-1 region.
AWS credentials are retrieved from the local CLI configuration (~/.aws/credentials) or environment variables.

## 3. Virtual Private Cloud (VPC)

A custom VPC (10.0.0.0/16) acts as the foundation of the infrastructure.

Benefits:

* Full control over IP addressing

* Isolation from other networks

* Centralized routing and security policies

## 4. Subnets

Three subnets are deployed in different Availability Zones for high availability:

* 10.0.1.0/24 → eu-north-1a

* 10.0.2.0/24 → eu-north-1b

* 10.0.3.0/24 → eu-north-1c

This ensures redundancy: if one AZ goes down, resources in other AZs remain operational.

## 5. EC2 Instance & Network Interface

* A t3.micro EC2 instance (free-tier eligible) is launched.

* A dedicated network interface is attached with a static private IP (10.0.1.20).

* Custom tagging (Name = paolot) ensures resources are easily identifiable.

# 🛠️ Terraform Workflow & Commands

Terraform follows a declarative workflow: you describe the desired infrastructure in .tf files, and Terraform ensures reality matches that description.

Here are the key commands in the workflow:

## 1. Initialization

terraform init

* Prepares the working directory

* Downloads providers (e.g., AWS)

* Configures the remote S3 backend

## 2. Validation

terraform validate

* Checks configuration syntax

* Ensures references between resources are valid

## 3. Formatting

terraform fmt

* Applies consistent formatting

* Improves readability and maintains clean version control history

## 4. Planning

terraform plan

* Shows what Terraform will create, modify, or destroy

* Essential for reviewing changes before applying

## 5. Applying

terraform apply

* Provisions resources on AWS

* Executes changes defined in .tf files

* Can be auto-approved with -auto-approve

## 6. Inspecting State

terraform show

* Displays current infrastructure as tracked in state

* Useful for auditing or debugging

## 7. Destroying

terraform destroy

* Deletes all resources defined in the project

* Ensures cost optimization and avoids leaving unused infrastructure running



Manage EC2 networking using static IPs and interfaces

Follow best practices with validation, planning, and version control
