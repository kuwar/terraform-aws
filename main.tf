# EC2 Instance in Public Subnet
resource "aws_instance" "public_instance" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  key_name               = var.pem_key_name
  associate_public_ip_address = true

  tags = {
    Name = "public-ec2-instance"
  }
}

# EC2 Instance in Private Subnet
resource "aws_instance" "private_instance" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = var.pem_key_name
  associate_public_ip_address = false

  tags = {
    Name = "private-ec2-instance"
  }
}