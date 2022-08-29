output "PROD_REGISTRY_ID" {
	description = "The account ID of the registry holding the repository"
	value = aws_ecr_repository.prod_api_ecr.registry_id
}
output "PROD_REPO_URL" {
	description = "The URL of the repository"
	value = aws_ecr_repository.prod_api_ecr.repository_url
}

output "db_endpoint" {
	description = "Endpoint URL of the database"
	value = aws_db_instance.pioows-prod-db.endpoint

}

output "TESTING_REPO_URL" {
	description = "The URL of the repository"
	value = aws_ecr_repository.testing_api_ecr.repository_url
}

output "db_testing_endpoint" {
	description = "Endpoint URL of the database"
	value = aws_db_instance.pioows-testing-db.endpoint

}
