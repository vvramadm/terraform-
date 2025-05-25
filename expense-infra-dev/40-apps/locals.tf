locals {
  resource_name="${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  backend_sg_id = data.aws_ssm_parameter.backend_sg_id.value
  frontend_sg_id = data.aws_ssm_parameter.frontend_sg_id.value
  ansible_sg_id = data.aws_ssm_parameter.ansible_sg_id.value
  database_subnet_ids =split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
  private_subnet_ids =split(",",data.aws_ssm_parameter.private_subnet_ids.value)[0]
  public_subnet_ids =split(",",data.aws_ssm_parameter.public_subnet_ids.value)[0]
  
  zone_id = "Z09407641B27Z7IYQWK9Y"
  domain_name = "ramops.online"
}