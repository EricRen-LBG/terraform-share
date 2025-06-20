
terraform {
  required_version = ">= 1.10.0, <2.0.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.36.1"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.73.1, < 6.36.2"
    }
  }
  #    cloud {
  #        organization = "lbg-cloud-platform"
  #        workspaces {
  #            name = "playpen-bb2ac1-gcp"
  #        }
  #    }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "vpc" {
  source = "./vpc"

  project_id = var.project_id
  vpc_name   = var.vpc_name

  vpc_cidr_01 = var.vpc_cidr_01
  vpc_cidr_02 = var.vpc_cidr_02
}

module "compute_engine" {
  source = "./compute_engine"

  project_id       = var.project_id
  vm_name          = var.vm_name
  vpc_network_link = module.vpc.network_link  # output from vpc module
  vpc_subnet_link  = module.vpc.subnet02_link # output from vpc module

}

