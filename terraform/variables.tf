variable "project_id" {
  description = "GCP Project ID donde se creará el clúster"
  type        = string
}

variable "region" {
  description = "Región de GCP donde desplegar el clúster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Nombre del clúster GKE"
  type        = string
  default     = "exercise-10-cluster"
}

variable "machine_type" {
  description = "Tipo de máquina para los nodos del clúster"
  type        = string
  default     = "e2-small"
}

variable "node_count" {
  description = "Cantidad de nodos por zona"
  type        = number
  default     = 2
}
