resource "aws_instance" "app_prod"{
    instance_type = "t2.micro"
    ami = "ami-090fa75af13c156b4"
    tags = {
        name = "Production"
    }
}