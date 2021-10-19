resource "aws_launch_configuration" "mkahn_lan" {
  name_prefix   = "mkahn-web-"
  image_id      = aws_ami_from_instance.mkahn_ami.id
  instance_type = "t2.micro"
  iam_instance_profile = "admin_role"
  key_name             = "tf-key-pair"
  security_groups      = [aws_security_group.mkahn_allow_http.id]
  # user_data = fire("/install.sh")

  lifecycle {
    create_before_destroy = true
  }
}