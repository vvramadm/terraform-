locals {
  resource_name="${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id
  public_subnet_ids =split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
}