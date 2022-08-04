output "PROD_REGISTRY_ID" {
	description = "The account ID of the registry holding the repository"
	value = aws_ecr_repository.prod_api_ecr.registry_id
}
output "PROD_REPO_URL" {
	description = "The URL of the repository"
	value = aws_ecr_repository.prod_api_ecr.repository_url
}
output "PROD_INSTANCE_URL" {
	description = "URL of the EC2 Instance for production"
	value = aws_instance.app_prod.public_ip
}
output "PROD_INSTANCE_ARN" {
	description = "ARN of the EC2 Instance for production"
	value = aws_instance.app_prod.arn
}
output "PROD_INSTANCE_ID" {
	description = "ID of the EC2 Instance for production"
	value = aws_instance.app_prod.id
}