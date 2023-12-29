resource "aws_vpc" "new_vpc" {
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "new_vpc"
    }
}

resource "aws_subnet" "new_subnet_queue" {
  availability_zone = "us-east-1a"
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.1.0/24"
    tags = {
        Name = "new_subnet_queue"
    }
}


resource "aws_subnet" "new_subnet_database" {
  availability_zone = "us-east-1b"
  vpc_id     = aws_vpc.new_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "new_subnet_database"
  }
}


resource "aws_vpc" "new_service_rest" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "new_service_rest"
  }
}
resource "aws_subnet" "new_subnet_rest" {
  availability_zone = "us-east-1c"
  vpc_id     = aws_vpc.new_service_rest.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "new_subnet_rest"
  }
}

