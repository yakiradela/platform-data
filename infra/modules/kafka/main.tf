variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

resource "aws_security_group" "kafka_sg" {
  name        = "kafka-sg"
  description = "Security group for Kafka cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"] # עדכן לפי טווח ה-VPC שלך
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "kafka-sg"
  }
}

resource "aws_msk_cluster" "this" {
  cluster_name           = "dev-msk"
  kafka_version          = "3.6.0"
  number_of_broker_nodes = 2 # ודא שיש בדיוק 2 תת־רשתות (AZs), או שנה ל-3

  broker_node_group_info {
    instance_type   = "kafka.m5.large"
    client_subnets  = var.subnet_ids
    security_groups = [aws_security_group.kafka_sg.id]
  }

  encryption_info {
    encryption_in_transit {
      in_cluster    = true
      client_broker = "TLS"
    }
  }

  tags = {
    Name        = "dev-msk"
    Environment = "dev"
  }
}
