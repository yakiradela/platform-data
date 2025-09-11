variable "subnet_ids" {
  type = list(string)
}

resource "aws_redshift_subnet_group" "default" {
  name        = "redshift-subnet-group-dev"
  description = "Subnet group for Redshift cluster"
  subnet_ids  = var.subnet_ids

  tags = {
    Environment = "dev"
    Name        = "redshift-subnet-groups-dev"
  }
}

resource "aws_redshift_cluster" "main" {
  cluster_identifier         = "dev-redshift"
  node_type                  = "ra3.xlplus"
  master_username            = "adminuser"
  master_password            = "Yakiradela1234!"
  database_name              = "dataplatform"
  cluster_type               = "single-node"
  port                       = 5439
  publicly_accessible        = false
  skip_final_snapshot        = true
  cluster_subnet_group_name  = aws_redshift_subnet_group.default.name

  tags = {
    Environment = "dev"
    Name        = "dev-redshift"
  }
}

