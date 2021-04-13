resource "aws_vpc" "techlab0002-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-techlab0002"
  }
}

resource "aws_subnet" "techlab0002-main" {
  vpc_id     = aws_vpc.techlab0002-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "techlab0002-gw" {
  vpc_id = aws_vpc.techlab0002-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "techlab0002-a" {
  vpc_id         = aws_vpc.techlab0002-main.id
  route_table_id = aws_route_table.techlab0002-rt.id
}


resource "aws_route_table" "techlab0002-rt" {
  vpc_id = aws_vpc.techlab0002-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.techlab0002-gw.id
  }


  tags = {
    Name = "techlab0002-AxwayTechlab"
  }
}











