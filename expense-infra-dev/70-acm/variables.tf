variable "project_name" {

    default = "expense"
  
}
variable "environment" {
  default = "dev"
}
variable "common_tags" {
  default = {
    Project = "expense"
    Terraform = "true"
    Environment = "dev"
  }

}

variable "domain_name" {
  
  default = "ramops.online"
}

variable "zone_id" {
  
  default = "Z09407641B27Z7IYQWK9Y"
}