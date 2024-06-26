resource "aws_default_vpc" "default_vpc" {
  tags = {
    Name = "default vpc"
  }
}


resource "aws_security_group" "sgswarm" {
  name   = "sgswarm"
  vpc_id = aws_default_vpc.default_vpc.id
  tags = {
    Name = "allow_tls"
  }
  # Allow all inbound
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Enable ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
