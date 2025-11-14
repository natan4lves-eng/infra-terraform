variable "subnet_ids" {}
variable "sg_id" {}

resource "aws_launch_template" "lt" {
  name_prefix   = "web-"
  
  image_id      = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [var.sg_id]
  }

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              echo "Servidor no Auto Scaling" > /var/www/html/index.html
              EOF
            )
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 4
  min_size             = 1

  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
}
