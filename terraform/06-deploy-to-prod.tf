resource "kubernetes_service" "deploy" {
  metadata {
    name = "production"
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