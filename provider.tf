terraform {                             
  required_providers {                  #this part of the code is used to identify
    aws = {                             #terraform as provider
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
            
provider "aws" {                # Configure the AWS Provider         
  region = "eu-north-1"                
}                                      

