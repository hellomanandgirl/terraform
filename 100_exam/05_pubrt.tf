resource "aws_route_table" "mkahn-pubrt" {
  vpc_id = aws_vpc.mkahn_vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.mkahn-ig.id
    }
  tags = {
    Name = "mkahn-pubrt"
  }
}