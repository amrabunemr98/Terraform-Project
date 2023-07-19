output "sg-pub" {
    value = aws_security_group.sg_pub.id
}

output "sg-pri" {
    value = aws_security_group.sg_pri.id
}

output "sg-pub-lb" {
    value = aws_security_group.sg_lb_pub.id
}

output "sg-pri-lb" {
    value = aws_security_group.sg_lb_private.id
}