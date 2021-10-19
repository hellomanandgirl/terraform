resource "aws_eip" "mkahn_eip_pria"{
    # instance = aws_instance.web.id
    vpc      = true
}
resource "aws_eip" "mkahn_eip_pric"{
    # instance = aws_instance.web.id
    vpc      = true
}
resource "aws_nat_gateway" "mkahn_ngw_pria" {
  allocation_id = aws_eip.mkahn_eip_pria.id
  subnet_id     = aws_subnet.mkahn_puba.id

  tags = {
    Name = "mkahn-ngw-pria"
  }
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.example]
}

resource "aws_nat_gateway" "mkahn_ngw_pric" {
  allocation_id = aws_eip.mkahn_eip_pric.id
  subnet_id     = aws_subnet.mkahn_pubc.id

  tags = {
    Name = "mkahn-ngw-pria"
  }
#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.example]
}
