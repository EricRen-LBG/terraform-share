variable "project_id" {}
variable "vm_name" {}
variable "vpc_network_link" {}
variable "vpc_subnet_link" {}

# for vm service account 
resource "google_service_account" "default" {
  account_id   = "my-custom-vm-sa"
  display_name = "Custom SA for VM Instance"
}

# for vm external IP address
resource "google_compute_address" "static_ip" {
  name   = "my-static-ip"
  region = "europe-west2"
}

resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "n2-standard-2"
  zone         = "europe-west2-a"

  tags = ["http-server", "https-server"]

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-balanced"
    }
  }

  can_ip_forward = true

  network_interface {
    access_config {
      nat_ip       = google_compute_address.static_ip.address
      network_tier = "PREMIUM"
    }

    network            = var.vpc_network_link
    stack_type         = "IPV4_ONLY"
    subnetwork         = var.vpc_subnet_link
    subnetwork_project = var.project_id
  }

  reservation_affinity {
    type = "ANY_RESERVATION"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }

  service_account {
    #    email  = "818184655557-compute@developer.gserviceaccount.com"
    email  = google_service_account.default.email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_vtpm                 = true
  }

}
