resource "aws_security_group" "ssh_in_out" {
  vpc_id = "${var.vpc_id}"
  name = "dmogiliver-ssh_in_out"
}


resource "aws_security_group_rule" "ssh_in" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["${local.ipAddress}"]
  security_group_id = "${aws_security_group.ssh_in_out.id}"
}

resource "aws_security_group_rule" "ssh_out" {
  type = "egress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.ssh_in_out.id}"
}

