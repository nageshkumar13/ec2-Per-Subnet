resource "aws_instance" "ec2" {
  count                       = 3
  ami                         = var.ami[count.index]
  instance_type               = var.instance_type
  iam_instance_profile        = aws_iam_instance_profile.networking_ec2_profile.name
  subnet_id                   = var.subnet_id[count.index]
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  tags = {
    Name                      = "ec2_No.${count.index}"
  }
}
