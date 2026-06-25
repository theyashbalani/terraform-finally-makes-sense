output "ec2-public-ip" {
    value = aws_instance.my-ubuntu-instance.public_ip
}

output "ec2-public-dns" {
    value = aws_instance.my-ubuntu-instance.public_dns
}
