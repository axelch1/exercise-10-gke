output "cluster_name" {
  description = "Nombre del clúster GKE creado"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "IP del endpoint del clúster (para kubectl)"
  value       = google_container_cluster.primary.endpoint
}

output "kubeconfig_command" {
  description = "Comando para configurar kubectl y apuntar a este clúster"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.primary.name} --region ${var.region}"
}
