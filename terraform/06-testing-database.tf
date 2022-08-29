#terraform script provisioning PostgreSQL database that will be used as production database

resource "aws_db_instance" "pioows-testing-db" {
    allocated_storage = 10
    instance_class = "db.t3.micro"
    engine = "postgres"
    engine_version = "14.2"
    skip_final_snapshot = true
    publicly_accessible = true
    port = 5432
    username = var.db_username
    password = var.db_password
    db_name = "postgres"
    vpc_security_group_ids = [aws_security_group.db_sg.id]
    db_subnet_group_name = module.vpc.database_subnet_group
    

}