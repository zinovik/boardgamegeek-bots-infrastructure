resource "google_service_account" "spacelift" {
  account_id   = "spacelift"
  display_name = "Spacelift Deployment Service Account"
}

###

resource "google_service_account" "github" {
  account_id   = "github"
  display_name = "GitHub Deployment Service Account"
}
