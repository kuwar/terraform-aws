# Security Group for Public EC2 Instance (Allow SSH)
resource "aws_security_group" "public_sg" {
  vpc_id = aws_vpc.main.id

  name        = "public-ec2-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-ec2-sg"
  }
}

# Security Group for Private EC2 Instance
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main.id

  name        = "private-ec2-sg"

  # Allow inbound SSH (port 22) traffic from the public EC2 security group
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups   = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-ec2-sg"
  }
}

