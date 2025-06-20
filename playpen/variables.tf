variable "project_id" {
  description = "The ID of the GCP project where resources will be deployed"
  type        = string
  default     = "playpen-1f7fb3"

}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "europe-west2"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "europe-west2-c"
}

# Europ regions and zones:
# europe-west1 (Belgium) - Zones: europe-west1-b, europe-west1-c, europe-west1-d 
# europe-west2 (London, UK) - Zones: europe-west2-a, europe-west2-b, europe-west2-c 
# europe-west3 (Frankfurt, Germany) - Zones: europe-west3-a, europe-west3-b, europe-west3-c 
# europe-west4 (Netherlands) - Zones: europe-west4-a, europe-west4-b, europe-west4-c 
# europe-central2 (Warsaw, Poland) - Zones: europe-central2-b, europe-central2-c 

variable "vm_name" {
  description = "The Compute Engine name"
  type        = string
  default     = "instance-20250530-123456"
}

variable "vpc_name" {
  description = "The VPC network name"
  type        = string
  default     = "playpen-vpc"
}

variable "vpc_cidr_01" {
  type        = string
  default     = "10.132.0.0/20"
  description = "The CIDR block for the VPC."

}
variable "vpc_cidr_02" {
  type        = string
  default     = "10.154.0.0/20"
  description = "The CIDR block for the VPC."
}