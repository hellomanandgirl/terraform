resource "aws_vpc" "mkahn_vpc" {
    cidr_block          = "192.168.0.0/16"
    instance_tenancy    = "default"
    
    tags = {
        name = "mkahn-vpc"
    }
}