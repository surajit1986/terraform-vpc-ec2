resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id
  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  # the public SSH key
  key_name = aws_key_pair.vpckeypair.key_name
  tags = {
    Name = "surajit--Lab5-ec2"
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
 availability_zone = "us-east-2a"
 size = 20
 type = "gp2"
 tags = {
   Name = "surajit  extra volume"
 }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.example.id
} 
