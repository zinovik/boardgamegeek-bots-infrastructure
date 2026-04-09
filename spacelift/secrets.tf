resource "google_secret_manager_secret" "bgg_top100_bot_telegram_token" {
  secret_id = "bgg-top100-bot-telegram-token"

  labels = {
    environment = "production"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "bgg_top100_bot_telegram_token" {
  secret = google_secret_manager_secret.bgg_top100_bot_telegram_token.id

  secret_data = var.bgg_top100_bot_telegram_token
}

resource "google_secret_manager_secret" "bgg_top1000_bot_telegram_token" {
  secret_id = "bgg-top1000-bot-telegram-token"

  labels = {
    environment = "production"
  }

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "bgg_top1000_bot_telegram_token" {
  secret = google_secret_manager_secret.bgg_top1000_bot_telegram_token.id

  secret_data = var.bgg_top1000_bot_telegram_token
}
