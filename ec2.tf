resource "aws_spot_instance_request" "database" {
  ami = var.ami_dbs_centos7
  instance_type = "t3.medium"
  spot_price = "0.0125"
  wait_for_fulfillment = true
  subnet_id = data.aws_subnet.testing.id
  associate_public_ip_address = true
  security_groups = [
    data.aws_security_group.default.id, data.aws_security_group.allowall.id ]
  key_name = var.key_name
  ebs_optimized = true

  provisioner "file" {
    content = templatefile("templates/${var.database}.tpl", {
      instance_ip = aws_spot_instance_request.database.public_ip
    })
    destination = "/home/centos/${var.database}.sh"
    connection {
      host = aws_spot_instance_request.database.public_ip
      type = "ssh"
      user = "centos"
      private_key = file(var.pem_key)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/centos/${var.database}.sh",
      "./${var.database}.sh"
    ]
    connection {
      host = aws_spot_instance_request.database.public_ip
      type = "ssh"
      user = "centos"
      private_key = file(var.pem_key)
    }
  }
  tags = {
    "Name" = "${var.database}_Spot_instance"
    "Cost Center" = "R&D"
    "Created On" = formatdate("MM-DD-YYYY", timestamp())
    "Created By" = var.created_by
  }
}