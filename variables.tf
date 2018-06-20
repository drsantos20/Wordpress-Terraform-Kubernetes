variable "gcp-region" {
  default = "us-central1"
}

variable "gcp-zone" {
  default = "us-central1-b"
}

variable "gcp-project-name" {
  default = "k8-wordpress-mysql"
}

variable "platform-name" {
  default = "sample-platform"
}

variable "cluster-size" {
  default = 3
}

variable "instance-type" {
  default = "n1-standard-1"
}

variable "cluster-name" {
  default = "wordpress-cluster"
}

variable "username" {
  default = "terraform"
}

variable "password" {
  default = "strongPassword123"
}
