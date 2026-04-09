variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "boardgamegeek-bots"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "bgg_top100_bot_telegram_token" {
  description = "Telegram token for BGG Top100 Bot"
  type        = string
}

variable "bgg_top1000_bot_telegram_token" {
  description = "Telegram token for BGG Top1000 Bot"
  type        = string
}
