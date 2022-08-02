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

output "registry_id" {
	description = "The account ID of the registry holding the repository"
	value = aws_ecr_repository.repository.registry_id
}
output "repository_url" {
	description = "The URL of the repository"
	value = aws_ecr_repository.repository.repository_url
}