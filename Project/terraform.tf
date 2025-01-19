provider "kubernetes" {
  config_path = "~/.kube/config" 
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "python-app-namespace"
  }
}

resource "kubernetes_deployment" "python_app" {
  metadata {
    name      = "python-app"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "python-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "python-app"
        }
      }

      spec {
        container {
          image = "murali2002/prabhas:salaar"
          name  = "python-app"

          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "python_app_service" {
  metadata {
    name      = "python-app-service"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    selector = {
      app = "python-app"
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}
