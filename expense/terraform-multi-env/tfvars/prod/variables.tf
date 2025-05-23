variable "ami_id" {
  type        = string
  default     = "ami-098fef4b912c71b0e"
  description = "terraform practive amazon linux t3 micro"

}
variable "instances" {
  type        = map
  default     = {
    

  }
  
}

variable "key_name" {

  default = "LLkey"


}

variable "common_tags" {

  type = map
  default = {
    Project    = "expense"
    
    Terraform  = "true"
  }

}

variable "tags" {

  type = map
  
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


