variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Availability zone"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name"
}

# CIDR для подсетей (можно захардкодить в main.tf, но вынесем для удобства)
variable "public_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "private_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
}

# ID образа NAT-инстанса по заданию
variable "nat_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}