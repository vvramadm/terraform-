locals {
  resource_name="${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  ami_id = data.aws_ami.devops.id
  backend_sg_id = data.aws_ssm_parameter.backend_sg_id.value
  private_subnet_id = split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
   private_subnet_ids = split(",",data.aws_ssm_parameter.private_subnet_ids.value)
  app_alb_listener_arn = data.aws_ssm_parameter.app_alb_listener_arn.value 
}