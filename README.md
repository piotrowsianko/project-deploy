# FastAPI application in clouds!

Hi! This is a simple FastAPI application, a little bit modified from what is in the FastAPI docs. The main purpose of the project is to create CI/CD pipelines for application to be deployed on cloud platform.


# App stack

Application written in python, using libraries such as numpy,
Connection to database with SQLAlchemy and psycopg 2,


## Project stack

Cloud Provider: AWS with mix of Azure (To be changed!)
Database: PostgreSQL on AWS RDS,
Deployment: AWS EKS - Kubernetes cluster
Application accessed by AWS Load Balancer. 
Credentials were stored in Azure KeyVault but need to be changed after free trial,
Rest of variables used in pipelines were in Azure DevOps Library

# Pipelines
Pipelines declared in project are written in YAML to work on Azure Devops, I'll need to change it to Jenkins in the future.
- Terraform_init_AWS.yml main pipeline to standup AWS infra with Azure Keyvault credentials
- CI_Pipeline_ECR.yml first pipeline from Feature to Dev-test Branch, 
- CI_Pipeline_to_Prod.yml second pipeline, from dev-test to production,
- CD_deploy_to_prod.yml deployment pipeline from production branch.
