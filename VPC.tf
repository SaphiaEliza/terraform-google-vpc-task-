resource "google_compute_network" "vpc-network-team3" {
  name                    = var.vpc_name
  auto_create_subnetworks = "true"
  routing_mode            = "GLOBAL"
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

