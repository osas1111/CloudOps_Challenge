resource "aws_security_group" "ssh" {
  count         = var.enable_ssh ? 1 : 0
  name          = "SSH-Inbound"
  description   = "Allow inbound SSH traffic"
  vpc_id        = aws_vpc.cloud_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "https" {
  count         = var.enable_https ? 1 : 0
  name          = "HTTPS-Inbound"
  description   = "Allow inbound HTTPS traffic"
  vpc_id        = aws_vpc.cloud_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
