locals {

  resource_name = "${var.projcet_name}-${var.environment}"
  #az_info       = slice(data.aws_availability_zones.available.names, 0, 3)
  az_zones       =slice(data.aws_availability_zones.available.names,0,3)
  
}