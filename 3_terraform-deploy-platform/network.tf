resource "aws_vpc" "techlab0001-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-techlab0001"
  }
}

resource "aws_subnet" "techlab0001-main" {
  vpc_id     = aws_vpc.techlab0001-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "techlab0001-gw" {
  vpc_id = aws_vpc.techlab0001-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "techlab0001-a" {
  vpc_id         = aws_vpc.techlab0001-main.id
  route_table_id = aws_route_table.techlab0001-rt.id
}


resource "aws_route_table" "techlab0001-rt" {
  vpc_id = aws_vpc.techlab0001-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.techlab0001-gw.id
  }


  tags = {
    Name = "techlab0001-AxwayTechlab"
  }
}

