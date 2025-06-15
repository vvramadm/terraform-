module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = local.resource_name #expense-dev

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "transactions"
  username = "root"
  port     = "3306"
  password = "ExpenseApp1"
 

  vpc_security_group_ids = [local.mysql_sg_id]
  manage_master_user_password = false

 

  tags = merge(
    #var.common_tags,
    #var.rds_tags,
  {
    #Owner       = "user"
    Environment = "dev"
  }
  )

  # DB subnet group
  
  db_subnet_group_name = local.database_subnet_group_name

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  
}

module "zones" {
  source  = "terraform-aws-modules/route53/aws//modules/zones"
  version = "~> 3.0"

  zones = {
    "terraform-aws-modules-example.com" = {
      comment = "terraform-aws-modules-examples.com (production)"
      tags = {
        env = "production"
      }
    }

    "myapp.com" = {
      comment = "myapp.com"
    }
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 3.0"

  zone_name = var.zone_name

  records = [
    {
      name    = "mysql-${var.environment}"
      type    = "CNAME"
      ttl     = 1
      records = [
        module.db.db_instance_address
      ]
      allow_overwrite = true
    },
  ]
}