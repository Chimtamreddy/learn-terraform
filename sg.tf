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

#resource "aws_instance" "main" {
#  ami           = "ami-0f3c7d07486cad139"
#  instance_type = "t3.micro"
#  vpc_security_group_ids = [aws_security_group.allow_tls.id]
#  subnet_id = local.app_subnet_ids[0]
#}
#
#resource "aws_security_group" "allow_tls" {
#  name        = "allow_tls"
#  description = "Allow TLS inbound traffic and all outbound traffic"
#  vpc_id      = aws_vpc.main.id
#
#  tags = {
#    Name = "allow_tls"
#  }
#
#
#  ingress {
#    description = "SSH"
#    from_port   = 22
#    to_port     = 22
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
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

#resource "aws_launch_template" "main" {
#  name                   = local.name_prefix
#  image_id               = data.aws_ami.ami.id
#  instance_type          = var.instance_type
#  vpc_security_group_ids = [aws_security_group.main.id]
#
#
#  user_data = base64encode(templatefile("${path.module}/userdata.sh",
#    {
#      component = var.component
#    }))
#
#
#  tag_specifications {
#    resource_type = "instance"
#    tags          = merge(local.tags, { Name = "${local.name_prefix}-ec2" })
#  }
#}
#
#resource  "aws_autoscaling_group" "main" {
#  name        = "${local.name_prefix}-asg"
#  vpc_zone_identifier = var.subnet_ids
#  desired_capacity   = var.desired_capacity
#  max_size           = var.max_size
#  min_size           = var.min_size
#  target_group_arns = [aws_lb_target_group.main.arn]
#
#  launch_template {
#    id      = aws_launch_template.main.id
#    version = "$Latest"
#  }
#
#  tag {
#    key                 = "Name"
#    value               = local.name_prefix
#    propagate_at_launch = true
#  }
#}