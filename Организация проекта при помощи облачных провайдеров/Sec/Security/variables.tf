variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "bucket_name" {
  type        = string
  description = "Уникальное имя бакета"
}

variable "image_file" {
  type        = string
  description = "Путь к картинке"
}