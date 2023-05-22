variable "project_name" {
  type    = string
}

variable "enable_https" {
  type    = bool
  default = false
}

variable "enable_ssh" {
  type    = bool
  default = false
}

variable "vpc_cidr_block" {
  type    = string
}

variable "subnet_cidr_block" {
  type    = string
}

variable "availability_zone" {
  type    = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

