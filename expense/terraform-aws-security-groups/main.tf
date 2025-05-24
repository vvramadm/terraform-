resource "aws_security_group" "main" {

    vpc_id = var.vpc_id
    name = local.sg_final_name
    tags = merge(

        var.common_tags,
        var.sg_tags,

        {
            Name= local.sg_final_name
        }

    )

    egress = {

        from_port = 0
        to_port   = 0
        protocol = "-1"
        cidr_blocks =["0.0.0.0/0"]
    }
  
}