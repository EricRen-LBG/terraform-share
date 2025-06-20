
variable "project_id" {}
variable "vpc_name" {}
variable "vpc_cidr_01" {}
variable "vpc_cidr_02" {}

# Create the network
resource "google_compute_network" "playpen_vpc" {
  auto_create_subnetworks                   = false
  mtu                                       = 1460
  name                                      = var.vpc_name
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
  project                                   = var.project_id
  routing_mode                              = "REGIONAL"
}

# Create the subnetworks
resource "google_compute_subnetwork" "playpen_vpc_subnet_01" {
  ip_cidr_range = var.vpc_cidr_01

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.1
    metadata             = "EXCLUDE_ALL_METADATA"
  }

  name                       = "${var.vpc_name}-subnet-01"
  network                    = google_compute_network.playpen_vpc.self_link
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "europe-west1"
  stack_type                 = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "playpen_vpc_subnet_02" {
  ip_cidr_range = var.vpc_cidr_02

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.1
    metadata             = "EXCLUDE_ALL_METADATA"
  }

  name                       = "${var.vpc_name}-subnet-02"
  network                    = google_compute_network.playpen_vpc.self_link
  private_ip_google_access   = true
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = var.project_id
  purpose                    = "PRIVATE"
  region                     = "europe-west2"
  stack_type                 = "IPV4_ONLY"
}

# Output the network and subnet links and names
output "network_link" {
  value = google_compute_network.playpen_vpc.self_link
}
output "network_name" {
  value = google_compute_network.playpen_vpc.name
}

output "subnet01_link" {
  value = google_compute_subnetwork.playpen_vpc_subnet_01.self_link
}
output "subnet01_name" {
  value = google_compute_subnetwork.playpen_vpc_subnet_01.name
}

output "subnet02_link" {
  value = google_compute_subnetwork.playpen_vpc_subnet_02.self_link
}

output "subnet02_name" {
  value = google_compute_subnetwork.playpen_vpc_subnet_02.name
}

