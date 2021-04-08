resource "aws_vpc" "techlab1234-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-techlab1234"
  }
}

resource "aws_subnet" "techlab1234-main" {
  vpc_id     = aws_vpc.techlab1234-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "techlab1234-gw" {
  vpc_id = aws_vpc.techlab1234-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "techlab1234-a" {
  vpc_id         = aws_vpc.techlab1234-main.id
  route_table_id = aws_route_table.techlab1234-rt.id
}


resource "aws_route_table" "techlab1234-rt" {
  vpc_id = aws_vpc.techlab1234-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.techlab1234-gw.id
  }


  tags = {
    Name = "techlab1234-AxwayTechlab"
  }
}





