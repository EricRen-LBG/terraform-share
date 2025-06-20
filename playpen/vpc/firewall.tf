
resource "google_compute_firewall" "playpen_vpc_allow_custom_1" {
  allow {
    protocol = "all"
  }

  description   = "Allows connection from any source to any instance on the network using custom protocols."
  direction     = "INGRESS"
  name          = "${var.vpc_name}-allow-custom-1"
  network       = google_compute_network.playpen_vpc.name
  priority      = 65534
  project       = var.project_id
  source_ranges = [var.vpc_cidr_01]
}


resource "google_compute_firewall" "playpen_vpc_allow_custom_2" {
  allow {
    protocol = "all"
  }

  description   = "Allows connection from any source to any instance on the network using custom protocols."
  direction     = "INGRESS"
  name          = "${var.vpc_name}-allow-custom-2"
  network       = google_compute_network.playpen_vpc.name
  priority      = 65534
  project       = var.project_id
  source_ranges = [var.vpc_cidr_02]
}


resource "google_compute_firewall" "playpen_vpc_allow_ssh" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  description   = "Allows TCP connections from any source to any instance on the network using port 22."
  direction     = "INGRESS"
  name          = "${var.vpc_name}-allow-ssh"
  network       = google_compute_network.playpen_vpc.name
  priority      = 65534
  project       = var.project_id
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "playpen_vpc_allow_8000_external" {
  allow {
    ports    = ["8000"]
    protocol = "tcp"
  }

  description   = "Open port 8000 for http connection"
  direction     = "INGRESS"
  name          = "${var.vpc_name}-allow-8000-external"
  network       = google_compute_network.playpen_vpc.name
  priority      = 1000
  project       = var.project_id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "playpen_vpc_allow_9000_external" {
  allow {
    ports    = ["9000"]
    protocol = "tcp"
  }

  description   = "Open port 9000 for http connection"
  direction     = "INGRESS"
  name          = "${var.vpc_name}-allow-9000-external"
  network       = google_compute_network.playpen_vpc.name
  priority      = 1000
  project       = var.project_id
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
