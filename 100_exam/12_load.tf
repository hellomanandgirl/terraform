resource "aws_lb" "mkahn_lb" {
  name               = "mkahn-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.mkahn_allow_http.id]
  subnets            = [aws_subnet.mkahn_puba.id,aws_subnet.mkahn_pubc.id]

#   enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "test"
  }
}