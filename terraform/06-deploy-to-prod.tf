resource "kubernetes_service" "deploy" {
  metadata {
    name = "deploy"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "shop"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}