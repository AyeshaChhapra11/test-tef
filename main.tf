terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.12.0"
    }
  }
}

provider "google" {
  project = "gen-lang-client-0056426034"  # your project ID
  region  = "us-central1"                 # your region
}

# Use an existing bucket instead of creating a new one
data "google_storage_bucket" "demo_bucket" {
  name = "moviant-gemini-bucket-12345"    # bucket you already created
}

# (Optional) outputs if you want to reference this in other places / debug
output "bucket_name" {
  value = data.google_storage_bucket.demo_bucket.name
}

output "bucket_url" {
  value = data.google_storage_bucket.demo_bucket.url
}
