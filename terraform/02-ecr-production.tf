resource "aws_ecr_repository" "api_ecr" {
	name = "repository-for-api"
	image_tag_mutability = "MUTABLE"
  	image_scanning_configuration {
    	scan_on_push = false
  }
}