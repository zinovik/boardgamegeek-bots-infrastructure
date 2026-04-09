resource "google_storage_bucket" "boardgamegeek-ranks" {
  name     = "boardgamegeek-ranks"
  location = "europe-central2"

  versioning {
    enabled = true
  }

  cors {
    origin          = ["https://zinovik.github.io", "http://localhost:3000"]
    method          = ["GET"]
    response_header = ["Content-Type"]
    max_age_seconds = 3600
  }
}
