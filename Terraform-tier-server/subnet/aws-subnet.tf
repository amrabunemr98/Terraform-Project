resource "aws_subnet" "subnets-pub" {
    for_each = var.sub1
  vpc_id            = var.vpc
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name
  }
}

resource "aws_subnet" "subnets-private" {
    for_each = var.sub2
  vpc_id            = var.vpc
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = each.value.name
  }
}