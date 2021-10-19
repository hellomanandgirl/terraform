data "aws_instances" "web_a1_data" {
  instance_tags = {
    Name = "web-a1"
  }
}

resource "aws_lb_target_group_attachment" "mkahn_tg-ass" {
  target_group_arn = aws_lb_target_group.mkahn_lb_tg.arn
  target_id        = data.aws_instances.web_a1_data.private_ips[0]
  port             = 80
}