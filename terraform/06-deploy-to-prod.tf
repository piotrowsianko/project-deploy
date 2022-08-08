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
resource "local_file" "endpoint" {
  content  = kubernetes_service.deploy.status[0].load_balancer[0].ingress[0].hostname
  filename = ".endpoint"
}
resource "kubernetes_pod" "production" {
    metadata {
        name = "production"
        labels = {
            app = "production"
        }
    }
    spec {
        container {
            name = "production"
            image = "piotrowsianko/project:latest"
        }
    }
}