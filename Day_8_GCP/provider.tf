terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  credentials = "./terraform-420406-911f9da27718.json"
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}


