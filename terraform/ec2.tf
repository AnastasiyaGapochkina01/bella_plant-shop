resource "aws_instance" "app_server" {
  ami           = ami-0ecb62995f68bb549
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}

output "instance_ip" { value = aws_instance.app_server.public_ip }
