#----------------------------------------------------------------#
##                        VPC & Subnets                         ##
#----------------------------------------------------------------#
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Subnet resources
resource "aws_subnet" "restricted_ssh_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "restricted-ssh"
  }
}

resource "aws_subnet" "unrestricted_ssh_subnet" {
  vpc_id     = aws_vpc.test_vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "unrestricted-ssh"
  }
}

#----------------------------------------------------------------#
##                      Security Groups                         ##
#----------------------------------------------------------------#
resource "aws_security_group" "allow_ssh_anywhere" {
  name        = "allow-ssh-anywhere"
  description = "Allow SSH access from anywhere"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_ssh_vpc_only" {
  name        = "allow-ssh-vpc-only"
  description = "Allow SSH access from VPC CIDR only"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.test_vpc.cidr_block]
  }
}