resource "kubernetes_service" "deploy" {
  metadata {
    name = "production"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "website"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_pod" "production" {
    metadata {
        name = "production"
        labels = {
            app = "shop_prod"
        }
    }
    spec {
        container {
            name = "shop_prod"
            image = "piotrowsianko/project:latest"
        }
    }
}