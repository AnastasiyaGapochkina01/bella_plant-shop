resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.ansible.key_name
  subnet_id = var.instance_subnet

  tags = {
    Name = var.instance_name
  }

   provisioner "local-exec" {
     command = "cd ../ansible && ansible-playbook db.yaml -u ubuntu -i '${self.private_ip},'"
     interpreter = ["/bin/bash", "-c"]
   }
}
