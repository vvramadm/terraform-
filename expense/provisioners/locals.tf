
locals {
  
    instance_type=var.enivroment=="prod"?"t3.medium":"t3.micro"
}