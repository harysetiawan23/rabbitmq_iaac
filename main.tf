terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }

  backend "s3" {
  }
}


resource "aws_mq_broker" "rabbit_mq" {
  broker_name = var.broker_name
  # configuration {
  #   id       = aws_mq_configuration.test.id
  #   revision = aws_mq_configuratuon.test.latest_revision
  # }

  engine_type         = "RabbitMQ"
  engine_version      = "3.8.6"
  storage_type        = "ebs"
  host_instance_type  = "mq.t3.micro"
  security_groups     = ["${aws_security_group.rabbit_mq.id}"]
  subnet_ids          = var.subnet_id
  deployment_mode     = "SINGLE_INSTANCE"
  publicly_accessible = false


  user {
    username = var.username
    password = var.password
  }
}


resource "aws_security_group" "rabbit_mq" {
  name   = "${var.broker_name}-security-group"
  vpc_id = var.vpc_id
  
  ingress {
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = ["14.0.0.0/16"]
    description = "Centralize VPN"
  }

  ingress {
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = ["14.0.0.0/16"]
    description = "Centralize VPN"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["14.0.0.0/16"]
    description = "Centralize VPN"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internet"
  }
}
