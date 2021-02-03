variable created_by {
  type = string
  default = "Terraform"
}


variable database {
  type = string
  default = "sparksql"
}

variable "db_instance" {
  default = ""
}

variable "pem_key" {
  description = "Path to the .pem file for ssh access"
  type = string
  default = "~/.ssh/Devops.pem"
}

variable "ami_lps_centos7" {
  description = "AMI of Centos7 with presetup for LPS and 3dparties apps(embed, IS mock)"
  type = string
  default = "ami-0dfc47facee923550"
}

variable "ami_dbs_centos7" {
  description = "AMI of Centos7 with presetup for DB sources MYSQL, POSTGRES"
  type = string
  default = "ami-0d04dac32dc31f223"
}

variable "key_name" {
  description = "resource key_name"
  type = string
  default = "Devops"
}

variable "aws_vpc_id" {
  description = "VPC id"
  type = string
  default = "vpc-858861ec"
}

variable "aws_subnet_id" {
  description = "AWS subnet id"
  type = string
  default = "subnet-cda652a4"
}

variable "aws_security_group_id" {
  description = "AWS security group id"
  type = string
  default = "sg-e677818f"
}

variable "aws_security_group_id_all" {
  description = "AWS security group id to allow all connections"
  type = string
  default = "sg-0d80bbb7c6d91c534"
}

variable "region" {
  description = "EC2 region"
  type = string
  default = "us-east-2"
}