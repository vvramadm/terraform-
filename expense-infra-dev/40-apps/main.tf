module "ec2_mysql"{
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "mysql-server"
  ami = data.aws_ami.devops.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = ["local.mysql_sg_id"]
  subnet_id              = local.database_subnet_ids

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}