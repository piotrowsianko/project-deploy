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
