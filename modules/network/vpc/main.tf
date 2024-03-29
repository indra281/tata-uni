// Create VPC
resource "google_compute_network" "vpc" {
 name                    = "${var.name}-vpc"
 auto_create_subnetworks = "false"
}


// Create Subnet
resource "google_compute_subnetwork" "pub-subnet" {
 name          = "${var.name}-public-subnet"
 ip_cidr_range = "${var.pub-subnet-cidr}"
 network       = "${var.name}-vpc"
 depends_on    = ["google_compute_network.vpc"]
 region        = "asia-south1"
}

resource "google_compute_subnetwork" "private-subnet" {
 name          = "${var.name}-private-subnet"
 ip_cidr_range = "${var.private-subnet-cidr}"
 network       = "${var.name}-vpc"
 depends_on    = ["google_compute_network.vpc"]
 region        = "asia-south1"
}

// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  name    = "${var.name}-firewall"
  network = "${google_compute_network.vpc.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}