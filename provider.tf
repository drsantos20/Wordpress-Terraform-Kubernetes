provider "google" {
  credentials = "${file("~/Downloads/k8-wordpress-mysql-32bde434dce6.json")}"
  project     = "${var.gcp-project-name}"
  region      = "${var.gcp-region}"
}
