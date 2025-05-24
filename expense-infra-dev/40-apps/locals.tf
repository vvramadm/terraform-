locals {
  resource_name="${var.project_name}-${var.environment}"
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id
  database_subnet_ids =split(",",data.aws_ssm_parameter.database_subnet_ids.value)[0]
}