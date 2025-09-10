provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "webserver" {
  ami           = "ami-0a716d3f3b16d290c"
  instance_type = "t3.micro"
  key_name      = "large.pem"

  tags = {
    Name = "WebServer"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y docker.io docker-compose git
    systemctl enable docker
    systemctl start docker
  EOF
}
