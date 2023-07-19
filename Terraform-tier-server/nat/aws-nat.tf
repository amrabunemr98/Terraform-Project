#resource of elestic ip
resource "aws_eip" "eip" {
  domain = "vpc"
}

#resource of nat
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = var.sub-pub1

  tags = {
    Name = var.nat-gw
  }
}
