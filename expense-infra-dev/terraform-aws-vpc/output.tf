output "default_vpc_info" {

  value = data.aws_vpc.default


 }
 output "vpc_id" {
   value = aws_vpc.main.id
  
 }

 output "main_route_table" {
   value=data.aws_route_table.main.id
  
 }

  output "public_subnet_ids" {
    value = aws_subnet.public[*].id
    
  }
   output "private_subnet_ids" {
    value = aws_subnet.private[*].id
    
  }
   output "database_subnet_ids" {
    value = aws_subnet.database[*].id
    
  }