resource "google_compute_instance" "default" {
name = "qa7-web-linux-${count.index + 1}"
count = "${var.count}"
machine_type = "${var.machine_type}"

boot_disk {
     initialize_params {
         image = "${var.web-srv-image}"
         }
     }   
network_interface {
    subnetwork = "${var.subnet-pub}"
    access_config {
         }
    }
metadata {
sshKeys = "indra:${file(".//modules//instances//key.pub")}"
    }
}
