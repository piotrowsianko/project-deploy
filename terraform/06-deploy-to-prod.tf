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
    count = var.prod ? 1 : 0
    metadata {
        name = "production"
        labels = {
            app = "website"
        }
    }
    spec {
        container {
            name = "website"
            image = "piotrowsianko/project:latest"
        }
    }
}