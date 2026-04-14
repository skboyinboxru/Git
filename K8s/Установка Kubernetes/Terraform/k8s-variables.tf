variable "k8s_master_cores" {
  type    = number
  default = 2
}

variable "k8s_master_memory" {
  type    = number
  default = 4
}

variable "k8s_master_fraction" {
  type    = number
  default = 20
}

variable "k8s_master_disk_size" {
  type    = number
  default = 30
}

# === Параметры для Kubernetes worker нод ===
variable "k8s_worker_cores" {
  type    = number
  default = 2
}

variable "k8s_worker_memory" {
  type    = number
  default = 4
}

variable "k8s_worker_fraction" {
  type    = number
  default = 20
}

variable "k8s_worker_disk_size" {
  type    = number
  default = 30
}

variable "k8s_workers_count" {
  type    = number
  default = 4
}