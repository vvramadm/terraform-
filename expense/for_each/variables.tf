variable "ami_id" {
  type        = string
  default     = "ami-098fef4b912c71b0e"
  description = "terraform practive amazon linux t3 micro"

}
variable "instances" {
  type        = map
  default     = {
    
    mysql = "t3.micro"
    frontend = "t3.micro"
    backend = "t3.micro"
  }
  
}

variable "key_name" {

  default = "LLkey"


}

variable "tags" {

  type = map
  default = {

    Name       = "backend"
    Project    = "terraform"
    Component  = "backend"
    Enivroment = "DEV"
    Terraform  = "true"
  }



}

variable "sg_name" {

  default = "allow_ssh"
}

variable "sg_description" {

  default = "Allow port number 22 for SSH access"

}

variable "from_port" {

  default = 22
  type    = number
}

variable "to_port" {

  default = 22
  type    = number
}

variable "protocol" {

  default = "tcp"
}

variable "ingress_cidr" {

  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "enivroment" {

  default = "dev"
}


