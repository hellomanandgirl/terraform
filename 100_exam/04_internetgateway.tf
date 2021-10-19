resource "aws_internet_gateway" "mkahn-ig" {
  vpc_id = aws_vpc.mkahn_vpc.id

  tags = {
    Name = "mkahn-ig"
  }
}

output "vpc-id" {
  value       =aws_vpc.mkahn_vpc.id
}
