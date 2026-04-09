resource "google_service_account_iam_member" "spacelift_workload_identity_user" {
  service_account_id = google_service_account.spacelift.name
  role               = "roles/iam.workloadIdentityUser"

  member = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.spacelift_pool.workload_identity_pool_id}/attribute.repository/${var.spacelift_repository}/attribute.stack/${var.stack}"
}

resource "google_project_iam_member" "spacelift_browser" {
  project = var.project_id
  role    = "roles/browser"
  member  = "serviceAccount:${google_service_account.spacelift.email}"
}

###

resource "google_service_account_iam_member" "github_workload_identity_user" {
  service_account_id = google_service_account.github.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/projects/${var.project_number}/locations/global/workloadIdentityPools/${google_iam_workload_identity_pool.github_pool.workload_identity_pool_id}/attribute.ref/refs/heads/main"
}

resource "google_project_iam_member" "github_functions_admin" {
  project = var.project_id
  role    = "roles/cloudfunctions.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_run_admin" {
  project = var.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_sa_user" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${google_service_account.github.email}"
}

resource "google_project_iam_member" "github_artifact_writer" {
  project = var.project_id
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github.email}"
}

###

resource "google_storage_bucket_iam_member" "bgg_top100_bot_bucket_access" {
  bucket = google_storage_bucket.boardgamegeek-ranks.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.bgg_top100_bot.email}"
}

resource "google_storage_bucket_iam_member" "bgg_top1000_bot_bucket_access" {
  bucket = google_storage_bucket.boardgamegeek-ranks.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.bgg_top1000_bot.email}"
}

resource "google_storage_bucket_iam_member" "bgg_games_ranks_cacher_bucket_access" {
  bucket = google_storage_bucket.boardgamegeek-ranks.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.bgg_games_ranks_cacher.email}"
}

#

# resource "google_cloudfunctions_function_iam_member" "bgg_top100_bot_function_invoker" {
#   project        = var.project_id
#   region         = var.region
#   cloud_function = "bgg-games-ranks-parser"
#   role           = "roles/cloudfunctions.invoker"
#   member         = "serviceAccount:${google_service_account.bgg_top100_bot.email}"
# }

# resource "google_cloudfunctions_function_iam_member" "bgg_top1000_bot_function_invoker" {
#   project        = var.project_id
#   region         = var.region
#   cloud_function = "bgg-games-ranks-parser"
#   role           = "roles/cloudfunctions.invoker"
#   member         = "serviceAccount:${google_service_account.bgg_top1000_bot.email}"
# }

# resource "google_cloudfunctions_function_iam_member" "bgg_games_ranks_cacher_function_invoker" {
#   project        = var.project_id
#   region         = var.region
#   cloud_function = "bgg-games-ranks-parser"
#   role           = "roles/cloudfunctions.invoker"
#   member         = "serviceAccount:${google_service_account.bgg_games_ranks_cacher.email}"
# }
