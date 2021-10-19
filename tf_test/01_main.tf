provider "aws"{
    region="ap-northeast-2"
}

resource "aws_vpc" "test_vpc" {
    cidr_block          = "10.0.0.0/16"
    instance_tenancy    = "default"
    
    tags = {
        Name = "test-vpc"
    }
}