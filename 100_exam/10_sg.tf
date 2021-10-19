resource "aws_security_group" "mkahn_allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.mkahn_vpc.id

  ingress = [
    {
      description      = "http from VPC"
      from_port        = 80 #포트의 범위를 지정
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   = null
      prefix_list_ids   = null
      self              = null
    },
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   = null
      prefix_list_ids   = null
      self              = null
    }
  ]

  egress = [
    {
      description      = "HTTP from VPC"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups   = null
      prefix_list_ids   = null
      self              = null
    }
  ]

  tags = {
    Name = "mkahn-allow-http"
  }
}