output "sub-pub1" {
    value = aws_subnet.subnets-pub["public-subnet1"].id
}

output "sub-pub2" {
    value = aws_subnet.subnets-pub["public-subnet2"].id
}

output "sub-pri1" {
    value = aws_subnet.subnets-private["private-subnet1"].id
}

output "sub-pri2" {
    value = aws_subnet.subnets-private["private-subnet2"].id
}

