resource "google_service_account" "spacelift" {
  account_id   = "spacelift"
  display_name = "Spacelift Deployment Service Account"
}

###

resource "google_service_account" "github" {
  account_id   = "github"
  display_name = "GitHub Deployment Service Account"
}

###

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
