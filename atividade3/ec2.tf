variable "subnet_id" {}
variable "sg_id" {}

resource "aws_instance" "web_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<html><h1>Bem-vindo ao meu site!</h1></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "WebServer"
  }
}
