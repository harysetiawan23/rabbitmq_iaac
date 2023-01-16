variable "subnet_id" {
  description = "AWS VPC Subnet ID"
  type = list(string)
}

variable "vpc_id" {
  type = string
  description = "AWS VPC ID"
}

variable "broker_name" {
  description = "Rabbit MQ Broker Name"
}

variable "username" {
  description = "Rabbit MQ Username"
}

variable "password" {
  description = "Rabbit MQ Password"
}