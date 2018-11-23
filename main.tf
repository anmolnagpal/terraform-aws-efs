# Define composite variables for resources
module "label" {
  source    = "git::https://github.com/anmolnagpal/terraform-null-label.git"
  namespace = "${var.managedby}"
  name      = "${var.name}"
  env       = "${var.env}"
  delimiter = "${var.delimiter}"
  tags      = "${var.tags}"
}

resource "aws_efs_file_system" "default" {
  tags = "${module.label.tags}"
}

resource "aws_efs_mount_target" "default" {
  count           = "${length(var.availability_zones)}"
  file_system_id  = "${aws_efs_file_system.default.id}"
  subnet_id       = "${element(var.subnets, count.index)}"
  security_groups = ["${aws_security_group.default.id}"]
}

resource "aws_security_group" "default" {
  name        = "${module.label.id}"
  description = "EFS"
  vpc_id      = "${var.vpc_id}"

  lifecycle {
    create_before_destroy = true
  }

  ingress {
    from_port       = "2049"                     # NFS
    to_port         = "2049"
    protocol        = "tcp"
    security_groups = ["${var.security_groups}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${module.label.tags}"
}
