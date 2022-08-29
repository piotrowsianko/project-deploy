resource "aws_ecr_repository" "testing_api_ecr" {
	name = "testing"
	image_tag_mutability = "MUTABLE"
  	image_scanning_configuration {
    	scan_on_push = false
  }
}