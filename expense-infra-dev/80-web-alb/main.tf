module "web_alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = false
  # expense-dev-web-alb
  name    = "${var.project_name}-${var.environment}-web-alb"
  vpc_id  = data.aws_ssm_parameter.vpc_id.value
  ip_address_type     = "ipv4"
  load_balancer_type = "application"
  subnets = local.public_subnet_ids
  create_security_group = false
  security_groups = [local.web_alb_sg_id]
  enable_deletion_protection = false
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-web-alb"
    }
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hello, I am from webalb foxed respones </h1>"
      status_code  = "200"
    }
  }
}


module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  
  zone_name = var.zone_name

  records = [
    {
  
      name    = "expense-${var.environment}" #expense-dev.ramops.online
      type    = "A"
      alias = {
      name                   = module.web_alb.dns_name
      zone_id                = module.web_alb.zone_id
          }
      allow_overwrite= true
    }
  ]
  }

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = module.web_alb.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = local.https_certificate_arn
# default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/html"
#       message_body = "<h1>Hello, I am from webalb foxed respones </h1>"
#       status_code  = "200"
#     }
#   }
# }