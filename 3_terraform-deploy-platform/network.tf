resource "aws_vpc" "workshop-0001-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-workshop-0001"
  }
}

resource "aws_subnet" "workshop-0001-main" {
  vpc_id     = aws_vpc.workshop-0001-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "workshop-0001-gw" {
  vpc_id = aws_vpc.workshop-0001-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "workshop-0001-a" {
  vpc_id         = aws_vpc.workshop-0001-main.id
  route_table_id = aws_route_table.workshop-0001-rt.id
}


resource "aws_route_table" "workshop-0001-rt" {
  vpc_id = aws_vpc.workshop-0001-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.workshop-0001-gw.id
  }


  tags = {
    Name = "workshop-0001-AxwayTechlab"
  }
}



















