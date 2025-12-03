resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = aws_key_pair.ansible.key_name

  tags = {
    Name = var.instance_name
  }
}
