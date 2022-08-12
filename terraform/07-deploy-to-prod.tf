//  deploy website on a public endpoint
resource "kubernetes_service" "deploy" {
  metadata {
    name = "deploy"
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

resource "kubernetes_pod" "prodenv" {
  depends_on = [
    module.eks
  ]
  metadata {
    name = "prodenv"
    labels = {
      app = "website"
    }
  }
  spec {
    container {
      name  = "website"
      image = "piotrowsianko/project:latest"
    }
  }
}