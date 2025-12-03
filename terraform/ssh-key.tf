resource "aws_key_pair" "ansible" {
  key_name   = "ansible-ssh-key" 
  public_key = file(var.ssh_public_key_path)
}
