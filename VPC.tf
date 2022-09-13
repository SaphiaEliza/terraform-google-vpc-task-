//Creating VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "prod-wp-env"
  description             = "VPC Network for WordPress"
  auto_create_subnetworks = false
}

//Creating Subnetwork VPC
resource "google_compute_subnetwork" "subnetwork" {
  name          = "wp-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc_network.id

  depends_on = [
    google_compute_network.vpc_network
  ]
}

//Creating Firewall VPC Network
resource "google_compute_firewall" "firewall" {
  name    = "wp-firewall"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }
  source_tags = ["wp", "wordpress"]
  depends_on = [
    google_compute_network.vpc_network
  ]
}



resource "google_compute_firewall" "allow-traffic" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22", "3306"]
  }
  source_tags   = ["wp", "wordpress", "wordpress-firewall"]
  source_ranges = ["0.0.0.0/0"]
}

