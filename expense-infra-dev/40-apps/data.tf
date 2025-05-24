 data "aws_ssm_parameter" "mysql_sg_id" {
     name ="/${var.project_name}/${var.environment}/mysql_sg_id"
     
 }

data "aws_ssm_parameter" "database_subnet_ids" {

     name = "/${var.project_name}/${var.environment}/database_subnet_ids"
     
     }

 data "aws_ssm_parameter" "backend_sg_id" {
     name ="/${var.project_name}/${var.environment}/backen_sg_id"
     
 }

data "aws_ssm_parameter" "private_subnet_ids" {

     name = "/${var.project_name}/${var.environment}/private_subnet_ids"
     
     }


     data "aws_ssm_parameter" "frontende_sg_id" {
     name ="/${var.project_name}/${var.environment}/frontend_sg_id"
     
 }

data "aws_ssm_parameter" "public_subnet_ids" {

     name = "/${var.project_name}/${var.environment}/public_subnet_ids"
     
     }



     
data  "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ami" "devops" {

    most_recent = true
    owners = [222352935292] # aws account id
    filter {
      
      name = "name"
      values = ["test123"]
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