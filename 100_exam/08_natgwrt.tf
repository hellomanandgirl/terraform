resource "aws_route_table" "mkahn-natrt_pria" {
  vpc_id = aws_vpc.mkahn_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.mkahn_ngw_pria.id
    }
  tags = {
    Name = "mkahn-natrt-pria"
  }
}
resource "aws_route_table" "mkahn-natrt_pric" {
  vpc_id = aws_vpc.mkahn_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_nat_gateway.mkahn_ngw_pric.id
    }
  tags = {
    Name = "mkahn-natrt-pric"
  }
}