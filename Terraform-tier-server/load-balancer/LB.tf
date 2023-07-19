# Load Balancer of public
resource "aws_lb" "public-lb" {
  name               = "Public-LB"
  load_balancer_type = "application"
  internal           = false #for public instance
  security_groups    = [var.sg-pub-lb]
  subnets            = [var.sub-pub1, var.sub-pub2]
}

# Target group of public
resource "aws_lb_target_group" "public-tg" {
  name     = "Public-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc

  health_check {
    path                = "/"
    port                = 80
  }
   tags = {
    Name = "tg-pub"
  }
}



resource "aws_lb_listener" "public_listener" {
  load_balancer_arn = aws_lb.public-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.public-tg.arn
  }
}




# Load Balancer of private
resource "aws_lb" "private-lb" {
  name               = "Private-LB"
  load_balancer_type = "application"
  internal           = true #for private instance
  security_groups    = [var.sg-pri-lb]
  subnets            = [var.sub-pri1, var.sub-pri2]
}

# Target group of private
resource "aws_lb_target_group" "private-tg" {
  name     = "Private-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc

  health_check {
    path                = "/"
    port                = 80
  }
   tags = {
    Name = "tg-private"
  }
}


resource "aws_lb_listener" "private_listener" {
  load_balancer_arn = aws_lb.private-lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.private-tg.arn
  }
}