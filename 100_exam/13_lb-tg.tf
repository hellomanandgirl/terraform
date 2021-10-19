resource "aws_lb_target_group" "mkahn_lb_tg" {
  name        = "mkahn-lb-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.mkahn_vpc.id


health_check {
  enabled             = true
  healthy_threshold   = 3
  interval            = 5
  matcher             = "200"
  path                = "/"
  port                = "traffic-port"
  protocol            = "HTTP"
  timeout             = 2
  unhealthy_threshold = 2
  }
}