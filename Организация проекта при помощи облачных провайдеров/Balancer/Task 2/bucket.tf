resource "yandex_storage_bucket" "images" {
  bucket = var.bucket_name
  acl    = "public-read"

  anonymous_access_flags {
    read = true
    list = false
  }
}

resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.images.id
  key    = basename(var.image_file)
  source = var.image_file
  acl    = "public-read"
}

locals {
  image_url = "https://${yandex_storage_bucket.images.bucket_domain_name}/${yandex_storage_object.image.key}"
}