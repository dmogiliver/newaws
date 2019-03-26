resource "aws_vpc" "dmogiliver-vpc" {
  cidr_block = "${var.cidr_block}"
  enable_dns_hostnames = true
  tags {
    Name = "dmogiliver-eks-node"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}