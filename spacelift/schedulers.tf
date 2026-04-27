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

resource "google_cloud_scheduler_job" "bgg_top100_bot" {
  name     = "bgg-top100-bot"
  project  = var.project_id
  schedule = "0 9 * * 6"

  http_target {
    uri         = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top100-bot?channelId=@bggtop100&isDevMode=off"
    http_method = "GET"

    oidc_token {
      service_account_email = "boardgamegeek-bots@appspot.gserviceaccount.com"
      audience              = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top100-bot"
    }
  }
}

resource "google_cloud_scheduler_job" "bgg_top1000_bot" {
  name     = "bgg-top1000-bot"
  project  = var.project_id
  schedule = "0 9 * * 6"

  http_target {
    uri         = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top1000-bot?channelId=@bggtop1000&isDevMode=off"
    http_method = "GET"

    oidc_token {
      service_account_email = "boardgamegeek-bots@appspot.gserviceaccount.com"
      audience              = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-top1000-bot"
    }
  }
}

resource "google_cloud_scheduler_job" "bgg_games_ranks_cacher" {
  name     = "bgg-games-ranks-cacher"
  project  = var.project_id
  schedule = "0 0 1 * *"

  http_target {
    uri         = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-games-ranks-cacher"
    http_method = "GET"

    oidc_token {
      service_account_email = "boardgamegeek-bots@appspot.gserviceaccount.com"
      audience              = "https://europe-central2-boardgamegeek-bots.cloudfunctions.net/bgg-games-ranks-cacher"
    }
  }
}
