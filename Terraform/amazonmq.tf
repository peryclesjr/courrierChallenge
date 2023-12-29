data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


resource "aws_mq_broker" "my_broker" {
  broker_name = "my-rabbitmq-broker"
  engine_type = "RabbitMQ"
  engine_version = "3.8.6"
  host_instance_type = "mq.t3.micro" # for free tier

  user {
    # I know this is a risk, but I have to continue with this for now
    username = "guest_test"
    password = "guest1231345454897"
  }

  apply_immediately = true
  publicly_accessible = false
  deployment_mode = "SINGLE_INSTANCE"
  subnet_ids = [tolist(data.aws_subnets.default_subnets.ids)[0]]
  security_groups = [aws_security_group.mq_sg.id]
}

resource "aws_security_group" "mq_sg" {
  name        = "mq_security_group"
  description = "Security group for AmazonMQ broker"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 5671  # Default port for RabbitMQ with SSL
    to_port     = 5671
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}