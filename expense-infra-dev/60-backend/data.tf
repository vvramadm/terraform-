 data "aws_ssm_parameter" "backend_sg_id" {
     name ="/${var.project_name}/${var.environment}/backend_sg_id"
     
 }

data "aws_ssm_parameter" "app_alb_listener_arn" {
  name  = "/${var.project_name}/${var.environment}/app_alb_listener_arn"
  
}

data "aws_ssm_parameter" "private_subnet_ids" {

     name = "/${var.project_name}/${var.environment}/private_subnet_ids"
     
     }

     
data  "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ami" "devops" {

    most_recent = true
    owners = [222352935292] # aws account id
    filter {
      
      name = "name"
      values = ["test555"]
    }
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
}