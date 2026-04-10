resource "google_service_account" "bgg_games_ranks_parser" {
  account_id   = "bgg-games-ranks-parser"
  display_name = "BGG Games Ranks Parser Service Account"
}

resource "google_service_account" "bgg_top100_bot" {
  account_id   = "bgg-top100-bot"
  display_name = "BGG Top 100 Bot Service Account"
}

resource "google_service_account" "bgg_top1000_bot" {
  account_id   = "bgg-top1000-bot"
  display_name = "BGG Top 1000 Bot Service Account"
}

resource "google_service_account" "bgg_games_ranks_cacher" {
  account_id   = "bgg-games-ranks-cacher"
  display_name = "BGG Games Ranks Cacher Service Account"
}

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

resource "google_secret_manager_secret_iam_member" "bgg_top100_bot_secret_accessor" {
  secret_id = google_secret_manager_secret.bgg_top100_bot_telegram_token.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.bgg_top100_bot.email}"
}

resource "google_secret_manager_secret_iam_member" "bgg_top1000_bot_secret_accessor" {
  secret_id = google_secret_manager_secret.bgg_top1000_bot_telegram_token.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_service_account.bgg_top1000_bot.email}"
}
