resource "aws_vpc" "george-lab-main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "AxwayTechlab-george-lab"
  }
}

resource "aws_subnet" "george-lab-main" {
  vpc_id     = aws_vpc.george-lab-main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_internet_gateway" "george-lab-gw" {
  vpc_id = aws_vpc.george-lab-main.id

  tags = {
    Name = "AxwayTechlab"
  }
}

resource "aws_main_route_table_association" "george-lab-a" {
  vpc_id         = aws_vpc.george-lab-main.id
  route_table_id = aws_route_table.george-lab-rt.id
}


resource "aws_route_table" "george-lab-rt" {
  vpc_id = aws_vpc.george-lab-main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.george-lab-gw.id
  }


  tags = {
    Name = "george-lab-AxwayTechlab"
  }
}














