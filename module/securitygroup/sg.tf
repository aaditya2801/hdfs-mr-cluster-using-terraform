resource "aws_security_group" "mysg" {
  depends_on = [
    var.sg_depends
  ]
  name         = var.sg_name
  description  = var.sg_desc
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = var.proto
      cidr_blocks = [var.all_cidr]
    }
  }
  ingress {
    from_port   = var.custom_tcp[0]
    to_port     = var.custom_tcp[1]
    protocol    = var.proto
    cidr_blocks = [var.all_cidr]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.all_cidr]
  }
  tags = {
    Name = var.sg_tag
  }
}