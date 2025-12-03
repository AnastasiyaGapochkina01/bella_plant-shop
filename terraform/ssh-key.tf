resource "aws_key_pair" "ubuntu" {
  key_name   = "ubuntu-ssh-key" 
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMRuFuMIODUZtzVlLDe0f6ZRn1LYcTJuKgU0B6Z6rgiT ubuntu@ip-172-31-68-21"
}
