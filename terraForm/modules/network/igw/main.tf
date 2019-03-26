resource "aws_internet_gateway" "dmogiliver-igw" {
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "dmogiliver-igw"
  }
}