resource "aws_vpc" "sprints_vpc" {
  cidr_block       = var.cidr-block
  tags = {
    Name = var.vpc-tag
  }
}