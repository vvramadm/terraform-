variable "project_name"{
    default = "expense"
  
}

variable "environment"{
    default = "dev"
  
}
variable "mysql_sg_tags"{
    default = {
        component = "mysql"
        }
      
}
variable "backend_tags"{
    default = {
        component= "backend"
    }
  
}

variable "frontend_tags"{
    default = {

        component = "frontend"
    }
  
}

variable "bastion_sg_tags"{
    default = {

        component = "bastion"
    }
  
}

variable "common_tags"{
    default = {

        Project = "expense"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "sg_name"{

    default = "mysql"
}

/* variable "vpc_id"{
  vpc_id = local.vpc_id
} */