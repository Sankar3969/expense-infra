module "Ingress-alb" {
  source  = "terraform-aws-modules/alb/aws"
  internal =false
  name = "${var.Project}-${var.Environment}-${var.Ingress-alb}"
  vpc_id             = local.vpc_id
  subnets            = local.public_subnet
  security_groups    = [local.Ingressalb_sg]
  create_security_group = false
  enable_deletion_protection = false
  tags = merge(
    var.common_tags,
    var.Ingress_alb_tags,
  {
    Name = "${var.Project}-${var.Environment}-${var.Ingress-alb}"
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = module.Ingress-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>I am from load balance listner for http</h1>"
      status_code  = "200"
    }
  }
  
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = module.Ingress-alb.arn
  port              = "443"
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.aws_cert


  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>I am from web load balance listner for https</h1>"
      status_code  = "200"
    }
  }
  
}
resource "aws_lb_target_group" "expense" {
  name     = "${var.Project}-${var.Environment}-${var.expense}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  target_type= "ip"
  health_check {
    healthy_threshold =2
    unhealthy_threshold =2
    interval = 5
    matcher  = "200-299"
    port     = "80"
    path     = "/"
    protocol = "HTTP"
    timeout  = 4
  }
}
resource "aws_lb_listener_rule" "frontend" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.expense.arn
  }

  condition {
    host_header {
      values = ["expense-${var.Environment}.${var.zone_name}"]
    }
  }
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name

  records = [
    {
      name    = "expense-${var.Environment}"
      type    = "A"
      alias   = {
        name    = module.Ingress-alb.dns_name
        zone_id = module.Ingress-alb.zone_id
      }
      
    }
  ]
  

}