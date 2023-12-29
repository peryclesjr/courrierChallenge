resource "aws_vpc" "vpc_events" {
  cidr_block = "10.0.0.0/16"
    tags = {
      Name = "courrier_challenge_vpc_events"
    }
}

resource "aws_subnet" "subnet_events" {
  availability_zone = "us-east-1a"
  vpc_id     = aws_vpc.vpc_events.id
  cidr_block = "10.0.1.0/24"
    tags = {
        Name = "courrier_challenge_subnet_queue"
    }
}


resource "aws_subnet" "new_subnet_database" {
  availability_zone = "us-east-1b"
  vpc_id     = aws_vpc.vpc_events.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "courrier_challenge_subnet_database"
  }
}

resource "aws_internet_gateway" "courrier_igw" {
  vpc_id     = aws_vpc.vpc_events.id
    tags = {
        Name = "courrier_challenge_igw"
    }
}

resource "aws_route_table" "courrier_route_table" {
  vpc_id         = aws_vpc.vpc_events.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.courrier_igw.id
    }
    tags = {
        Name = "courrier_challenge_route_table"
    }
}


resource "aws_vpc" "new_service_rest" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "courrier_challenge_vpc_service_rest"
  }
}

resource "aws_route_table_association" "courrier_route_table_association" {
  subnet_id      = aws_subnet.subnet_events.id
  route_table_id = aws_route_table.courrier_route_table.id
}

resource "aws_subnet" "new_subnet_rest" {
  availability_zone = "us-east-1c"
  vpc_id     = aws_vpc.new_service_rest.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "courrier_challenge_subnet_rest"
  }
}

resource "aws_internet_gateway" "courrier_rest_igw" {
  vpc_id     = aws_vpc.new_service_rest.id
  tags = {
    Name = "courrier_challenge_igw"
  }
}

resource "aws_route_table" "courrier_route_table_rest" {
  vpc_id         = aws_vpc.new_service_rest.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.courrier_rest_igw.id
  }
  tags = {
    Name = "courrier_challenge_route_table"
  }
}

resource "aws_security_group" "events_sg" {
    name        = "events_sg"
    description = "Allow inbound traffic"
    vpc_id      = aws_vpc.vpc_events.id
    tags = {
      Name = "events_sg"
    }

    ingress {
        description = "Allow inbound traffic"
        from_port   = 5671
        to_port     = 5671
        protocol    = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}