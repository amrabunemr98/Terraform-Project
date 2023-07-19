output "pri-lb-dns" {
    value = aws_lb.private-lb.dns_name
}

output "public-lb-dns" {
    value = aws_lb.public-lb.dns_name
}

output "pub-tg" {
  value = aws_lb_target_group.public-tg.arn  #for attachment of tg
}

output "pri-tg" {
  value = aws_lb_target_group.private-tg.arn  #for attachment of tg
}