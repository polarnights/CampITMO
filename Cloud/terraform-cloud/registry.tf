resource "yandex_container_registry" "helm-charts" {
  name = "helm-charts"
}

resource "yandex_container_registry" "app-images" {
  name = "app-images"
}

resource "yandex_container_repository" "vault" {
  name = "${yandex_container_registry.helm-charts.id}/vault"
}

resource "yandex_container_repository" "flask-app" {
  name = "${yandex_container_registry.app-images.id}/flask-app"
}

output "helm-charts-registry-id" {
  value = yandex_container_registry.helm-charts.id
}

output "app-images-registry-id" {
  value = yandex_container_registry.app-images.id
}

output "vault-repository-name" {
  value = yandex_container_repository.vault.name
}

output "flask-app-repository-name" {
  value = yandex_container_repository.flask-app.name
}

output "kubernetes_cluster_id" {
  value = yandex_kubernetes_cluster.k8s-zonal.id
}

output "kubernetes_cluster_endpoint" {
  value = yandex_kubernetes_cluster.k8s-zonal.master.0.external_v4_endpoint
}
