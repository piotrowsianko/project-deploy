terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "4.23.0"
			}
		}
	}
provider "aws" {
	region = "us-east-1"
	}
resource "aws_ecr_repository" "api_ecr" {
	name = "repository-for-api"
	}
