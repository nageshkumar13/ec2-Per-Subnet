output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.ec2[*].id
}

output "instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.ec2[*].public_ip
}
