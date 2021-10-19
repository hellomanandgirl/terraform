resource "aws_ami_from_instance" "mkahn_ami" {
  name               = "terraform-example"
  source_instance_id = aws_instance.web_a1.id
}