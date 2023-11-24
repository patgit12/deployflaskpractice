provider "aws" {
  region = var.region  # Set your desired AWS region
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-0fc5d935ebf8bc3bc"  # Specify your desired AMI ID
  instance_type = "t2.micro"  # Specify your desired instance type

  key_name = var.key_name  # Specify your key pair name

  tags = {
    Name = "FlaskAppEc2"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y docker.io
              sudo systemctl start docker
              sudo systemctl enable docker
              EOF
}

