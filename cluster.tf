resource "google_compute_disk" "wordpress-disk" {
  name = "wordpress-disk"
  zone = "${var.gcp-zone}"
  size = 200
}

resource "google_compute_disk" "mysql-disk" {
  name = "mysql-disk"
  zone = "${var.gcp-zone}"
  size = 200
}

resource "google_container_cluster" "cluster" {
  depends_on         = ["google_compute_disk.wordpress-disk", "google_compute_disk.mysql-disk"]
  name               = "${var.cluster-name}"
  zone               = "${var.gcp-zone}"
  initial_node_count = "${var.cluster-size}"

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "${var.instance-type}"
  }

  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster-name} --zone ${var.gcp-zone} --project ${var.gcp-project-name}"
  }

  provisioner "local-exec" {
    command = "kubectl cluster-info"
  }

  provisioner "local-exec" {
    command = "kubectl create secret generic mysql --from-literal=password=${var.password}"
  }

  provisioner "local-exec" {
    command = "kubectl create -f ."
  }

  provisioner "local-exec" {
    command = "kubectl get services wordpress"
  }
}

output "endpoint" {
  value = "${google_container_cluster.cluster.endpoint}"
}

output "node_pools" {
  value = "${google_container_cluster.cluster.cluster_ipv4_cidr}"
}
