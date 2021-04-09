resource "aws_vpc" "peanuts-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-peanuts"
  }
}

resource "aws_subnet" "peanuts-main" {
  vpc_id     = aws_vpc.peanuts-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "peanuts-gw" {
  vpc_id = aws_vpc.peanuts-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "peanuts-a" {
  vpc_id         = aws_vpc.peanuts-main.id
  route_table_id = aws_route_table.peanuts-rt.id
}


resource "aws_route_table" "peanuts-rt" {
  vpc_id = aws_vpc.peanuts-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.peanuts-gw.id
  }


  tags = {
    Name = "peanuts-AxwayTechlab"
  }
}







