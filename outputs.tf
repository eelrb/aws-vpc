


output "vpc-id" {
	
	value="${aws_vpc.my_vpc.id}"

}

output "subnet-id" {
	
	value="${aws_subnet.subnet1.id}"

}