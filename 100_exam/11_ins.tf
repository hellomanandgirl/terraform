resource "aws_eip" "mkahn_eip_ins"{
  instance = aws_instance.web_a1.id
  vpc      = true
}

resource "aws_instance" "web_a1" {
  ami           = "ami-0e4a9ad2eb120e054"
  instance_type = "t2.micro"
  key_name = "tf-key-pair"
  vpc_security_group_ids = [aws_security_group.mkahn_allow_http.id]
  availability_zone = "ap-northeast-2a"
  private_ip = "192.168.1.11"
  subnet_id = aws_subnet.mkahn_puba.id
  user_data = file("install.sh")

  tags = {
    Name = "web-a1"
    }
}
resource "aws_eip" "mkahn_eip_ins2"{
    instance = aws_instance.web_a2.id
    vpc      = true
}

resource "aws_instance" "web_a2" {
  ami           = "ami-0e4a9ad2eb120e054"
  instance_type = "t2.micro"
  key_name = "tf-key-pair"
  vpc_security_group_ids = [aws_security_group.mkahn_allow_http.id]
  availability_zone = "ap-northeast-2a"
  private_ip = "192.168.1.12"
  subnet_id = aws_subnet.mkahn_puba.id
  user_data = file("apache.sh")

  tags = {
    Name = "web-a2"
    }
}