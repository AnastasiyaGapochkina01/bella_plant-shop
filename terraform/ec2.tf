resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.jenkins.key_name
  subnet_id = var.instance_subnet
  vpc_security_group_ids = [aws_security_group.init_sg.id]

  tags = {
    Name = var.instance_name
  }

  lifecycle {
    ignore_changes = [ami]
  }

  provisioner "local-exec" {
    command = "sleep 10 && cd ../ansible && ansible-playbook -vv db.yaml -u ubuntu -i '${self.private_ip},'"
    interpreter = ["/bin/bash", "-c"]
  }
}
