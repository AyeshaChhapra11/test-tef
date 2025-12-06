terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.12.0"
    }
  }
}

provider "google" {
  project = "gen-lang-client-0056426034"
  region  = "us-central1"
}

resource "google_storage_bucket" "demo_bucket" {
  name                     = "moviant-gemini-bucket-12345"
  location                 = "US"
  force_destroy            = true
  public_access_prevention = "enforced"
}
