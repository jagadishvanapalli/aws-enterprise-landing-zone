resource "aws_vpc" "dev" {
  cidr_block           = var.dev_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.project}-dev-vpc"
    environment = "dev"
    project     = var.project
  }

}

resource "aws_subnet" "dev_public" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = var.dev_public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project}-dev-public-subnet"
    environment = "dev"
    project     = var.project
  }
}

resource "aws_vpc" "test" {
  cidr_block           = var.test_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.project}-test-vpc"
    environment = "test"
    project     = var.project
  }

}

resource "aws_subnet" "test_public" {
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.test_public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project}-test-public-subnet"
    environment = "test"
    project     = var.project
  }
}

resource "aws_vpc" "prod" {
  cidr_block           = var.prod_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.project}-prod-vpc"
    environment = "prod"
    project     = var.project
  }

}

resource "aws_subnet" "prod_public" {
  vpc_id                  = aws_vpc.prod.id
  cidr_block              = var.prod_public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.project}-prod-public-subnet"
    environment = "prod"
    project     = var.project
  }
}

resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    Name        = "${var.project}-dev-internet-gateway"
    environment = "dev"
    project     = var.project
  }
}

resource "aws_internet_gateway" "test" {
  vpc_id = aws_vpc.test.id
  tags = {
    Name        = "${var.project}-test-internet-gateway"
    environment = "test"
    project     = var.project
  }
}

resource "aws_internet_gateway" "prod" {
  vpc_id = aws_vpc.prod.id
  tags = {
    Name        = "${var.project}-prod-internet-gateway"
    environment = "prod"
    project     = var.project
  }
}

resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
  }
  tags = {
    Name        = "dev-route-table"
    environment = "dev"
    project     = var.project
  }
}

resource "aws_route_table" "test" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test.id
  }
  tags = {
    Name        = "test-route-table"
    environment = "test"
    project     = var.project
  }
}

resource "aws_route_table" "prod" {
  vpc_id = aws_vpc.prod.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod.id
  }
  tags = {
    Name        = "prod-route-table"
    environment = "prod"
    project     = var.project
  }
}

resource "aws_route_table_association" "dev_public" {
  subnet_id      = aws_subnet.dev_public.id
  route_table_id = aws_route_table.dev.id
}

resource "aws_route_table_association" "test_public" {
  subnet_id      = aws_subnet.test_public.id
  route_table_id = aws_route_table.test.id
}

resource "aws_route_table_association" "prod_public" {
  subnet_id      = aws_subnet.prod_public.id
  route_table_id = aws_route_table.prod.id
}

