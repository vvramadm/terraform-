 data "aws_ssm_parameter" "frontend_sg_id" {
     name ="/${var.project_name}/${var.environment}/frontend_sg_id"
     
 }

data "aws_ssm_parameter" "web_alb_listener_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_listener_arn"
  
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
      values = ["test5555"]
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