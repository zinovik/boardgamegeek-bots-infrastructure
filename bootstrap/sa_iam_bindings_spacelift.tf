resource "google_service_account" "spacelift" {
  account_id   = "spacelift"
  display_name = "Spacelift Deployment Service Account"
}

resource "google_service_account_iam_member" "spacelift_workload_identity_user" {
  service_account_id = google_service_account.spacelift.name
  role               = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.spacelift_pool.workload_identity_pool_id}/attribute.repository/${var.spacelift_repository}/attribute.stack/${var.stack}"
}

resource "google_project_iam_member" "spacelift_browser" {
  project = var.project_id
  role    = "roles/browser"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_secret_admin" {
  project = var.project_id
  role    = "roles/secretmanager.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_project_iam_member" "spacelift_cloudscheduler_admin" {
  project = var.project_id
  role    = "roles/cloudscheduler.admin"
  member  = "serviceAccount:${var.spacelift_service_account_email}"
}

resource "google_service_account_iam_member" "spacelift_act_as_appengine_sa" {
  service_account_id = "projects/${var.project_id}/serviceAccounts/${var.project_id}@appspot.gserviceaccount.com"
  role               = "roles/iam.serviceAccountUser"
  member             = "serviceAccount:${var.spacelift_service_account_email}"
}
