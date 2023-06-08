data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "NAME" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = var.key
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.NAME_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.NAME_instance_profile.name
  user_data = file("scripts/install.sh")

  tags = {
    App  = "NAME"
    Owner = var.owner
  }
}

resource "aws_security_group" "NAME_sg" {
  name        = "NAME_sg"
  description = "Allow traffic on port 3000 and enable SSH"

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // restrict with your CIDR or use a bastion host
  }

  ingress {
    from_port       = "3000"
    to_port         = "3000"
    protocol        = "tcp"
    security_groups = [aws_security_group.NAME_elb_sg.id]
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    App  = "NAME"
    Owner = var.owner
  }
}
