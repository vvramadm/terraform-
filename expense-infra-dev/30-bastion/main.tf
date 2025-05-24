module "ec2_bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "bastion-server"
  ami = data.aws_ami.devops.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  #monitoring             = true
  vpc_security_group_ids = ["local.bastion_sg_id"]
  subnet_id              = local.public_subnet_ids

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}