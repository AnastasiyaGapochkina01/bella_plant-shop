variable "instance_name" {
  description = "Value of the EC2 instance's Name tag."
  type        = string
  default     = "learn-terraform"
}

variable "instance_type" {
  description = "The EC2 instance's type."
  type        = string
  default     = "t3.micro"
}

variable "ssh_public_key_path" {
  description = "Path to public SSH-key"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}
