resource "aws_route_table_association" "mkahn-puba-ass" {
  subnet_id      = aws_subnet.mkahn_puba.id
  route_table_id = aws_route_table.mkahn-pubrt.id
}
resource "aws_route_table_association" "mkahn-pubc-ass" {
  subnet_id      = aws_subnet.mkahn_pubc.id
  route_table_id = aws_route_table.mkahn-pubrt.id
}