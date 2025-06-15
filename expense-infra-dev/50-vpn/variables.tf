variable "project_name" {

    default = "expense"
  
}
variable "environment" {
  default = "dev"
}
variable "instance_type" {
  type = string
  default = "t3.micro"
}
variable "key_name" {
  
  default     = "LLkey"
  

}