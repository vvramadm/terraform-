locals {
  resource_name="${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.devops.id
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
  private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
   private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  web_alb_listener_arn = data.aws_ssm_parameter.web_alb_listener_arn.value 
}