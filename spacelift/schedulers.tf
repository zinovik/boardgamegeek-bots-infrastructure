resource "google_cloud_scheduler_job" "bgg_top100_bot_dev" {
  name     = "bgg-top100-bot-dev"
  project  = var.project_id
  schedule = "0 15 * * 5"

  http_target {
    uri         = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top100-bot?channelId=446618160&isDevMode=on"
    http_method = "GET"

    oidc_token {
      service_account_email = "boardgamegeek-bots@appspot.gserviceaccount.com"
      audience              = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top100-bot"
    }
  }
}

resource "google_cloud_scheduler_job" "bgg_top1000_bot_dev" {
  name     = "bgg-top1000-bot-dev"
  project  = var.project_id
  schedule = "0 15 * * 5"

  http_target {
    uri         = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top1000-bot?channelId=446618160&isDevMode=on"
    http_method = "GET"

    oidc_token {
      service_account_email = "boardgamegeek-bots@appspot.gserviceaccount.com"
      audience              = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top1000-bot"
    }
  }
}
