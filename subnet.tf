resource "aws_subnet" "paolo1_subnet" {
  vpc_id            = aws_vpc.paolo_vpc.id   
  cidr_block        = "10.0.1.0/24"         
                                             
  availability_zone = "eu-north-1a"          

  tags = {
    Name = "paolo1_subnet"
  }
}

resource "aws_subnet" "paolo2_subnet" {
  vpc_id            = aws_vpc.paolo_vpc.id    
  cidr_block        = "10.0.2.0/24"          
                                             
  availability_zone = "eu-north-1b"          

  tags = {
    Name = "paolo2_subnet"
  }
}

resource "aws_subnet" "paolo3_subnet" {
  vpc_id            = aws_vpc.paolo_vpc.id    
  cidr_block        = "10.0.3.0/24"          
                                             
  availability_zone = "eu-north-1c"          

  tags = {
    Name = "paolo3_subnet"
  }
}