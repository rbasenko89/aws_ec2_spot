output "db_instance_public_ip" {
  value = aws_spot_instance_request.database.public_ip
}
