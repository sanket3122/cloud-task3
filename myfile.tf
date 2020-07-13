provider "aws" {
     region = "ap-south-1"
     profile = "sanket"
 }

resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "my-vpc"
  }
} 

resource "aws_subnet" "sub_1a" {
  vpc_id     = aws_vpc.main.id
  availability_zone= "ap-south-1a"
  cidr_block = "192.168.0.0/24"
  map_public_ip_on_launch ="true"

  tags = {
    Name = "mysubnet-1a"
  }
}

resource "aws_subnet" "sub_1b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.1.0/24"
  availability_zone= "ap-south-1b"

  tags = {
    Name = "mysubnet-1b"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
   
   tags = {
      Name = "myIGW"
   }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "myroute_table"
  }
}

resource "aws_route_table_association" "rta" {
    subnet_id      = aws_subnet.sub_1a.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_security_group" "Mysg1"{
   name            = "myVPC_SG"
   description     = " Allows SSH_HTTP_MYSQL"
   vpc_id          = aws_vpc.main.id
 
    ingress {
        description = "FOR_HTTP"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks =["0.0.0.0/0"]
        }

   ingress {
        description = "FOR_SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks =["0.0.0.0/0"]
        }
    

    ingress {
        description = "FOR_MYSQL"
        from_port   = 3306
        to_port     = 3306
        protocol    = "tcp"
        cidr_blocks =["0.0.0.0/0"]
        }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks =["0.0.0.0/0"]
        }
    
      tags ={
        Name = "allow_SSH_HTTP_MYSQL"
   }
}


resource "aws_instance" "myin_wp" {
   ami          = "ami-7e257211"
   instance_type= "t2.micro"
   key_name     = "finalkey2"
   vpc_security_group_ids = [aws_security_group.Mysg1.id]
   subnet_id    = aws_subnet.sub_1a.id
   
      tags ={
          Name = "Wordpress"
     }
}


resource "aws_instance" "myin_MYSQL" {
   ami          = "ami-08706cb5f68222d09"
   instance_type= "t2.micro"
   key_name     = "finalkey2"
   vpc_security_group_ids = [aws_security_group.Mysg1.id]
   subnet_id    = aws_subnet.sub_1b.id
   
      tags ={
          Name = "Mysql"
     }
}
