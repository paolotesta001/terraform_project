# This configuration is used to move the Terraform status file (terraform.tfstate) from local to a bucket S3 on 
# AWS, so it becomes shared, secure and tracked.

terraform {
  backend "s3" {
    bucket = "paolo-bucket-for-tfstate"  
    key = "PROD/terraform.tfstate"        
    region = "eu-north-1"                 

    use_lockfile = true                  # Causes a lock file to be created to prevent two people 
                                         # they run terraform apply at the same time
  }
}