resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = var.ssh_public_key_path

  tags = {
    Name = var.instance_name
  }
}
