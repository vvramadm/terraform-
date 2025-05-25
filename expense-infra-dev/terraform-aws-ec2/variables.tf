variable "ami_id" {
 default = {}

}
variable "name" {
  default = {}
}

variable "instance_type" {
 default = {}

}
variable "subnet_id" {
  default = {}
  
}

variable "vpc_security_group_ids" {
  default = {}
}

variable "key_name" {
  
  default = {}
}

variable "tags" {

  type = map(any)
  default = {

  
    Project    = "expense"
    Enivroment = "DEV"
    Terraform  = "true"
  }



}

variable "sg_name" {

  default = {}
}





variable "enivroment" {

  default = "dev"
}

