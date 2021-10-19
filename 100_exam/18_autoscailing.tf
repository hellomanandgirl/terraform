resource "aws_placement_group" "mkahn_pg" {
  name = "mkahn_pg"
  strategy = "cluster"
}
resource "aws_autoscaling_group" "mkahn_auto" {
  name                      = "mkahn-auto"
  health_check_grace_period = 10
  health_check_type         = "ELB"
  # placement_group           = aws_placement_group.mkahn_pg.id
  launch_configuration      = aws_launch_configuration.mkahn_lan.name
  min_size                  = 2
  max_size                  = 8
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.mkahn_puba.id,aws_subnet.mkahn_pubc.id]
}