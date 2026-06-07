data "yandex_iam_service_account" "sa" {
  name = "artem"
}

# Создаём KMS-ключ
resource "yandex_kms_symmetric_key" "bucket_key" {
  name              = "bucket-encryption-key"
  default_algorithm = "AES_128"
  rotation_period   = "8760h"
}

# Назначаем сервисному аккаунту роль на использование ключа
resource "yandex_resourcemanager_folder_iam_member" "sa_kms_user" {
  folder_id = var.folder_id
  role      = "kms.keys.encrypterDecrypter"
  member    = "serviceAccount:${data.yandex_iam_service_account.sa.id}"
}

# Единый ресурс бакета – сразу с шифрованием
resource "yandex_storage_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.bucket_key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

# Загружаем картинку (уже в зашифрованный бакет)
resource "yandex_storage_object" "image" {
  bucket = yandex_storage_bucket.bucket.id
  key    = basename(var.image_file)
  source = var.image_file
  acl    = "public-read"
}

# Вывод
output "bucket_name" {
  value = yandex_storage_bucket.bucket.id
}

output "image_url" {
  value = "https://${yandex_storage_bucket.bucket.bucket_domain_name}/${basename(var.image_file)}"
}