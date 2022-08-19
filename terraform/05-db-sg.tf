resource "aws_security_group" "db_sg" {
    name = "rds_sg"
    description = "Allows HTTP, SSH, PostgreSQL ingress and all egree"
    vpc_id = module.vpc.vpc_id
}
resource "aws_security_group_rule" "HTTP-ingress-prod" {
    type = "ingress"
    security_group_id = aws_security_group.db_sg.id
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows all HTTP incoming traffic"
}

resource "aws_security_group_rule" "SSH-ingress-prod" {
    type = "ingress"
    security_group_id = aws_security_group.db_sg.id
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows all SSH incoming traffic"
}

resource "aws_security_group_rule" "PostgreSQL-ingress-prod" {
    type = "ingress"
    security_group_id = aws_security_group.db_sg.id
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows all Postgre incoming traffic"
}

resource "aws_security_group_rule" "TCP-ingress-prod" {
    type = "ingress"
    security_group_id = aws_security_group.db_sg.id
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows all Postgre incoming traffic"
}

resource "aws_security_group_rule" "Kubernetes-access" {
  depends_on = [module.eks]
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.db_sg.id
  source_security_group_id = module.eks.cluster_security_group_id
}

resource "aws_security_group_rule" "All-egress-prod" {
  type              = "egress"
  security_group_id = aws_security_group.db_sg.id
  from_port         = 0
  to_port           = 65535
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Allows all outbound traffic"
}