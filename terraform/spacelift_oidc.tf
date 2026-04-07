resource "google_iam_workload_identity_pool" "spacelift_pool" {
  workload_identity_pool_id = "spacelift-pool"
  display_name              = "Spacelift Pool"
}

resource "google_iam_workload_identity_pool_provider" "spacelift_provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.spacelift_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "spacelift-provider"

  display_name = "Spacelift OIDC Provider"

  oidc {
    issuer_uri = "https://zinovik.app.spacelift.io"
  }

  attribute_mapping = {
    "google.subject"        = "assertion.sub"
    "attribute.repository"  = "assertion.repository"
    "attribute.stack"       = "assertion.stack"
    "attribute.workspace"   = "assertion.workspace"
  }

  attribute_condition = <<EOT
    assertion.aud == "google" &&
    assertion.repository == "zinovik/boardgamegeek-bots-infrastructure"
  EOT
}

resource "google_service_account" "spacelift" {
  account_id   = "spacelift"
  display_name = "Spacelift Deployment Service Account"
}

data "google_project" "project" {}

resource "google_service_account_iam_member" "workload_identity_user" {
  service_account_id = google_service_account.spacelift.name
  role = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/projects/${data.google_project.project.number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.spacelift_pool.workload_identity_pool_id}/attribute.repository/zinovik/boardgamegeek-bots-infrastructure"
}
