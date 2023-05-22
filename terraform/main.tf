variable "region" {
  type    = string
  default = "us-west-2"
}

module "network-core" {
  source  = "./modules/network-core"

  project_name      = "Cloud"
  enable_ssh        = true
  enable_https      = true
  availability_zone = "${var.region}a"
  vpc_cidr_block    = "10.0.0.0/16"
  subnet_cidr_block = "10.0.0.0/24"
}

module "compute" {
  source  = "./modules/compute"

  server_ami_id = "ami-0ab1a82de7ca5889c"
  server_instance_type = "t3.micro"
  server_key_pair_name = "aws-mluzgin-${var.region}.pem"
  subnet_id = module.network-core.cloud_subnet_id[0]
  vpc_security_group_ids = [
    module.network-core.ssh_security_group_id[0], 
    module.network-core.https_security_group_id[0]
  ]
}

# Add public ip to DNS
resource "aws_route53_record" "sa_infra_host" {
  zone_id = aws_route53_zone.sa_infra_zone.zone_id
  name    = "temp_sa.elcorp.io"
  type    = "A"
  ttl     = 300
  records = [module.compute.sa_host_public_ip]
}
