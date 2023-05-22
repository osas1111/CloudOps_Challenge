variable "server_ami_id" {
  type    = string
}

variable "server_instance_type" {
  type    = string
}

variable "server_key_pair_name" {
  type    = string
}

variable "subnet_id" {
  type    = string
}

variable "vpc_security_group_ids" {
  type    = list(string)
}
