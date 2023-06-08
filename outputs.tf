output "NAME" {
  value = "https://${aws_route53_record.NAME.name}"
}

output "IP_Address" {
  value = aws_instance.NAME.public_ip
}