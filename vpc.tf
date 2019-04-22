resource "aws_vpc" "my_vpc" {
    cidr_block = "${var.vpc-fullcidr}"
   #### these 2 true values are for use the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      owner = "${var.owner}"
      TTL = "${var.ttl}"
      Name = "${var.owner}-vpc"
    }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

  tags {
    owner = "${var.owner}"
    TTL = "${var.ttl}"
    Name = "${var.owner}-my_vpc_gateway"
  }
}


resource "aws_subnet" "subnet1" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  cidr_block = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  tags {
      owner = "${var.owner}"
      TTL = "${var.ttl}"
      Name = "Subnet1_cidr"
  	}
  }



resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.my_vpc.id}"
  tags {
      Name = "Public"
  }
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.gw.id}"
    }
}


resource "aws_route_table_association" "public_aza" {
    subnet_id = "${aws_subnet.subnet1.id}"
    route_table_id = "${aws_route_table.public.id}"
}