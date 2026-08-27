output "dev_vpc_id" {
  description = "The ID of the Dev VPC"
  value       = aws_vpc.dev.id
}

output "test_vpc_id" {
  description = "The ID of the Test VPC"
  value       = aws_vpc.test.id
}

output "prod_vpc_id" {
  description = "The ID of the Prod VPC"
  value       = aws_vpc.prod.id
}
output "dev_public_subnet_id" {
  description = "The ID of the Dev public subnet"
  value       = aws_subnet.dev_public.id
}
output "test_public_subnet_id" {
  description = "The ID of the Test public subnet"
  value       = aws_subnet.test_public.id
}

output "prod_public_subnet_id" {
  description = "The ID of the Prod public subnet"
  value       = aws_subnet.prod_public.id
}

output "dev_internet_gateway_id" {
  description = "The ID of the Dev internet gateway"
  value       = aws_internet_gateway.dev.id
}

output "test_internet_gateway_id" {
  description = "The ID of the Test internet gateway"
  value       = aws_internet_gateway.test.id
}

output "prod_internet_gateway_id" {
  description = "The ID of the Prod internet gateway"
  value       = aws_internet_gateway.prod.id
}

output "dev_route_table_id" {
  description = "The ID of the Dev route table"
  value       = aws_route_table.dev.id
}
output "test_route_table_id" {
  description = "The ID of the Test route table"
  value       = aws_route_table.test.id
}

output "prod_route_table_id" {
  description = "The ID of the Prod route table"
  value       = aws_route_table.prod.id
}

output "dev_route_table_association_id" {
  description = "The ID of the Dev route table association"
  value       = aws_route_table_association.dev_public.id
}

output "test_route_table_association_id" {
  description = "The ID of the Test route table association"
  value       = aws_route_table_association.test_public.id
}

output "prod_route_table_association_id" {
  description = "The ID of the Prod route table association"
  value       = aws_route_table_association.prod_public.id
}
