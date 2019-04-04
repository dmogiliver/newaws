resource "aws_subnet" "public-prod" {
  count = "${var.availability_zone_count}"
  vpc_id = "${var.vpc_id}"
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags {
    Name = "Public Subnet PROD-${count.index}"
    Tier = "Public"
    ENV = "PROD"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

