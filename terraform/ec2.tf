resource "aws_instance" "server" {
  ami           = ami-0ecb62995f68bb549
  instance_type = var.instance_type
  key_name = var.ssh_public_key_path

  tags = {
    Name = var.instance_name
  }
}
