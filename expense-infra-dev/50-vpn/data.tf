 data "aws_ssm_parameter" "vpn_sg_id" {
     name ="/${var.project_name}/${var.environment}/vpn_sg_id"
     
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
      values = ["OpenVPN Access Server Community Image-3b5882c4-551b-43fa-acfe-7f5cdb896ff1"]
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