resource "aws_route_table_association" "mkahn-pria-ass" {
  subnet_id      = aws_subnet.mkahn_pria.id
  route_table_id = aws_route_table.mkahn-natrt_pria.id
}
resource "aws_route_table_association" "mkahn-pric-ass" {
  subnet_id      = aws_subnet.mkahn_pric.id
  route_table_id = aws_route_table.mkahn-natrt_pric.id
}