data "aws_vpc" "devops" {
    id = var.aws_vpc_id
}

data "aws_subnet" "testing" {
    id = var.aws_subnet_id
}