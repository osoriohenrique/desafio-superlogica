resource "helm_release" "nginx" {
  count = var.prometheus_install == true ? 1 : 0

  name      = "nginx-ingress"
  chart     = "oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack"
  version   = "79.4.1"
  namespace = "monitoring"
  values = [
    file("${path.module}/values.yaml")
  ]

}