module "ec2_mysql"{
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-mysql"
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


module "ec2_backend" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-backend"
  ami = data.aws_ami.devops.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = ["local.backend_sg_id"]
  subnet_id              = local.private_subnet_ids

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


module "ec2_frontend"{
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "${local.resource_name}-frontend"
  ami = data.aws_ami.devops.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = ["local.frontnd_sg_id"]
  subnet_id              = local.public_subnet_ids

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}