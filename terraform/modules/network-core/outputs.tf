output "ssh_security_group_id" {
  value = aws_security_group.ssh[*].id
}

output "https_security_group_id" {
  value = aws_security_group.https[*].id
}

output "cloud_vpc_id" {
  value = aws_vpc.cloud_vpc[*].id
}

output "cloud_subnet_id" {
  value = aws_subnet.cloud_subnet[*].id
}

output "cloud_internet_gw_id" {
  value = aws_internet_gateway.cloud_internet_gw[*].id
}

output "cloud_route_table_id" {
  value = aws_route_table.cloud_route_table[*].id
}
