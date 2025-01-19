output "service_url" {
  value = "http://${kubernetes_service.python_app_service.spec[0].cluster_ip}:5000"
  description = "The URL of the Python application service"
}
