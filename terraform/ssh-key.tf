resource "aws_key_pair" "ubuntu" {
  key_name   = "ubuntu-ssh-key" 
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMRuFuMIODUZtzVlLDe0f6ZRn1LYcTJuKgU0B6Z6rgiT ubuntu@ip-172-31-68-21"
}

#resource "aws_key_pair" "jenkins" {
#  key_name   = "jenkins-ssh-key" 
#  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBLbv9x76oOdyJxyWnVF6lwp/hCf6dde+IuVotiPWmH4 jenkins@ip-172-31-68-21"
#}
