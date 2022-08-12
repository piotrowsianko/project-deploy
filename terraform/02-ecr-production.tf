resource "aws_ecr_repository" "prod_api_ecr" {
	name = "production"
	image_tag_mutability = "MUTABLE"
  	image_scanning_configuration {
    	scan_on_push = false
  }
}