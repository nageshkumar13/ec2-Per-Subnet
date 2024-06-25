# This resource creates an IAM role with the necessary permissions for SSM access of ec2.

resource "aws_iam_role" "iam_for_ec2_networking_ssm_access" {
  name               = "iam_for_ec2_networking_ssm_access"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [       
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ec2.amazonaws.com"   
        },
        "Effect": "Allow",
        "Sid": ""       
      }         
    ]           
  }   
EOF        
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role        = aws_iam_role.iam_for_ec2_networking_ssm_access.name
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Role - Policy Attachment
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role1" {
  role        = aws_iam_role.iam_for_ec2_networking_ssm_access.name
  policy_arn  = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Create the aws_iam_instance_profile role from the aws_iam_role

resource "aws_iam_instance_profile" "networking_ec2_profile" {
    name = "ssm-networking_ec2_profile"
    role = aws_iam_role.iam_for_ec2_networking_ssm_access.name
}

