output "rt-pub" {
    value = aws_route_table.public_rt.id
}


output "rt-pri" {
    value = aws_route_table.private_rt.id
}