# Output for count

# output "ec2-public-ip" {
#     value = aws_instance.my-ubuntu-instance[*].public_ip        # [*] splat expression
# }

# output "ec2-public-dns" {
#     value = aws_instance.my-ubuntu-instance[*].public_dns        # [*] splat expression
# }

# Output for for_each
output "ec2-public-ip" {
    value = [
        for instance in aws_instance.my-ubuntu-instance:        # for loop
        instance.public_ip
    ]
}

output "ec2-public-dns" {
    value = [
        for instance in aws_instance.my-ubuntu-instance:         # for loop
        instance.public_dns
    ]
}

