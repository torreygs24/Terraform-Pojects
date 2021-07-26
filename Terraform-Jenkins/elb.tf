# Create a new load balancer
resource "aws_elb" "web-elb" {
  name            = "web-elb"
  subnets         = local.pub_sub_ids
  security_groups = [aws_security_group.elb-sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 3
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = aws_instance.webserver.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 30

  tags = {
    Name = "web_elb"
  }
}


resource "aws_security_group" "elb-sg" {
  name = "elb-sg"
  description = "Allow traffic for web apps on elb"
  vpc_id = aws_vpc.prod_vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
