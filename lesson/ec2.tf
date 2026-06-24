# key pair
resource "aws_key_pair" "my-key-pair" {
  key_name   = "terrakey"
  public_key = file("terrakey.pub")
}

# VPC & Security Group
resource "aws_default_vpc" "my-default-vpc" {
}

resource "aws_default_security_group" "my-default-sg" {
  vpc_id = aws_default_vpc.my-default-vpc.id      # interpolation

  # inbound rules
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open to All"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open to All"
  }

  # outbound rules
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"    # equivalent to all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound Open to All"
  }
}

# ec2 instance
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my-ubuntu-instance" {
  tags = {
    Name = "terraec2"
  }
  
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"    # Free tier eligible instance type
  key_name      = aws_key_pair.my-key-pair.key_name   # interpolation
  vpc_security_group_ids = [aws_default_security_group.my-default-sg.id]   # interpolation
  
  root_block_device {
    volume_size = 10  # in GB
    volume_type = "gp3" # gp3, gp2, io1, io2, st1, sc1, or standard
  }
}

 
  