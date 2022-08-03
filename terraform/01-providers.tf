terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "4.24.0"
			}
		}
	}
provider "aws" {
	region = "us-east-1"
	}

provider "azurerm"{
	features {}
 
  # Configure a specific Subscription ID (optional)
  subscription_id = "dfcefdc0-4ded-42a0-933b-100fbb1721ed"
}