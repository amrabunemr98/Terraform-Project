#security group of public ec2
resource "aws_security_group" "sg_pub" {
  vpc_id = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks =  var.cidr-SG
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr-SG
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.cidr-SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = var.cidr-SG
  }
  tags = {
    Name = "Public-sg"
  }

}

#security group of private ec2
resource "aws_security_group" "sg_pri" {
  vpc_id = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks =  var.cidr-SG
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = var.cidr-SG
  }
  tags = {
    Name = "Private-sg"
  }

}

# SG of public load balancer
resource "aws_security_group" "sg_lb_pub" {
  vpc_id      = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr-SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr-SG
  }
  tags = {
    Name = "Pubile-sg-lb"
  }
}


# SG of private load balancer
resource "aws_security_group" "sg_lb_private" {
  vpc_id      = var.vpc

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr-SG
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr-SG
  }
  tags = {
    Name = "Private-sg-lb"
  }
}