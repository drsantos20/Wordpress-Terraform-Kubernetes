provider "google" {
  credentials = "path_to_the_file"        // e.g "${file("~/project.json")}"
  project     = "${var.gcp-project-name}"
  region      = "${var.gcp-region}"
}
