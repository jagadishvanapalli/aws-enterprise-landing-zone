resource "aws_ec2_transit_gateway" "main" {
  description = "Main Transit Gateway Dev, Test, and Prod VPC connectivity "

  tags = {
    Name        = "${var.project}-transit-gateway"
    environment = "shared"
    project     = var.project
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment" "dev" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = aws_vpc.dev.id
  subnet_ids         = [aws_subnet.dev_public.id]

  tags = {
    Name        = "${var.project}-dev-transit-gateway-attachment"
    environment = "dev"
    project     = var.project
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "test" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = aws_vpc.test.id
  subnet_ids         = [aws_subnet.test_public.id]

  tags = {
    Name        = "${var.project}-test-transit-gateway-attachment"
    environment = "test"
    project     = var.project
  }
}

resource "aws_ec2_transit_gateway_vpc_attachment" "prod" {
  transit_gateway_id = aws_ec2_transit_gateway.main.id
  vpc_id             = aws_vpc.prod.id
  subnet_ids         = [aws_subnet.prod_public.id]

  tags = {
    Name        = "${var.project}-prod-transit-gateway-attachment"
    environment = "prod"
    project     = var.project
  }
}

resource "aws_route" "dev_to_test" {
  route_table_id         = aws_route_table.dev.id
  destination_cidr_block = var.test_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.dev, aws_ec2_transit_gateway_vpc_attachment.test]
}

resource "aws_route" "dev_to_prod" {
  route_table_id         = aws_route_table.dev.id
  destination_cidr_block = var.prod_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.dev, aws_ec2_transit_gateway_vpc_attachment.prod]
}

resource "aws_route" "test_to_dev" {
  route_table_id         = aws_route_table.test.id
  destination_cidr_block = var.dev_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.test, aws_ec2_transit_gateway_vpc_attachment.dev]
}

resource "aws_route" "test_to_prod" {
  route_table_id         = aws_route_table.test.id
  destination_cidr_block = var.prod_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.test, aws_ec2_transit_gateway_vpc_attachment.prod]
}

resource "aws_route" "prod_to_dev" {
  route_table_id         = aws_route_table.prod.id
  destination_cidr_block = var.dev_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.prod, aws_ec2_transit_gateway_vpc_attachment.dev]
}

resource "aws_route" "prod_to_test" {
  route_table_id         = aws_route_table.prod.id
  destination_cidr_block = var.test_vpc_cidr
  transit_gateway_id     = aws_ec2_transit_gateway.main.id

  depends_on = [aws_ec2_transit_gateway_vpc_attachment.prod, aws_ec2_transit_gateway_vpc_attachment.test]
}