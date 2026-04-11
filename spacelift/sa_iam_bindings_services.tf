resource "google_cloud_run_service_iam_member" "bgg_top100_bot_function_invoker" {
  project  = var.project_id
  location = var.region
  service  = "bgg-games-ranks-parser"

  role   = "roles/run.invoker"
  member = "serviceAccount:bgg-top100-bot@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_cloud_run_service_iam_member" "bgg_top1000_bot_function_invoker" {
  project  = var.project_id
  location = var.region
  service  = "bgg-games-ranks-parser"

  role   = "roles/run.invoker"
  member = "serviceAccount:bgg-top1000-bot@${var.project_id}.iam.gserviceaccount.com"
}

resource "google_cloud_run_service_iam_member" "bgg_games_ranks_cacher_function_invoker" {
  project  = var.project_id
  location = var.region
  service  = "bgg-games-ranks-parser"

  role   = "roles/run.invoker"
  member = "serviceAccount:bgg-games-ranks-cacher@${var.project_id}.iam.gserviceaccount.com"
}
