variable "path" {default = "E:\\terrafrm\\credentials"}

provider "google" {
  credentials = "${file("${var.path}\\secret.json")}"
  project     = "decent-ellipse-249005"
  region      = "asia-south1"
  zone        = "asia-south1-a"
}