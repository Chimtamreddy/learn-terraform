#resource "aws_security_group" "main" {
#  name        = "${local.name_prefix}-sg"
#  description = "${local.name_prefix}-sg"
#  vpc_id      = var.vpc_id
#  tags        = merge(local.tags, { Name = "${local.name_prefix}-sg" })
#
#  ingress {
#    description = "SSH"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = var.ssh_ingress_cidr
#  }
#
#  egress {
#    from_port        = 0
#    to_port          = 0
#    protocol         = "-1"
#    cidr_blocks      = ["0.0.0.0/0"]
#    ipv6_cidr_blocks = ["::/0"]
#  }
#}

# Another Security Group

#resource "aws_security_group" "main" {
#  name        = "${local.name_prefix}-sg"
#  description = "${local.name_prefix}-sg"
#  vpc_id      = var.vpc_id
#
#  tags        = merge(local.tags, { Name = "${local.name_prefix}-sg" })
#}
#
#resource "aws_vpc_security_group_ingress_rule" "main" {
#  security_group_id = aws_security_group.main.id
#  description       = "SSH"
#  cidr_ipv4         = var.ssh_ingress_cidr
#  from_port         = 22
#  ip_protocol       = "tcp"
#  to_port           = 22
#}
#
#
#
#resource "aws_vpc_security_group_egress_rule" "main" {
#  security_group_id = aws_security_group.main.id
#  cidr_blocks      = ["0.0.0.0/0"]
#  cidr_ipv6         = "::/0"
#  ip_protocol       = "-1" # semantically equivalent to all ports
#}