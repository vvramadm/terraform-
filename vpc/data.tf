data "aws_availability_zones" "available" {
  state = "available"
}

 data "aws_vpc" "default" {
     
     default  = true
 }
# data "vpc_peering_connection_id" "peering" {
#   value=
# }


