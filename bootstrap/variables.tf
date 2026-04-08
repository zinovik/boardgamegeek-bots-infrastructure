variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "boardgamegeek-bots"
}

variable "project_number" {
  description = "GCP Project Number"
  type        = string
  default     = "676750851465"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-central2"
}

variable "oidc_issuer" {
  description = "OIDC issuer URL"
  type        = string
  default     = "https://zinovik.app.spacelift.io"
}

variable "spacelift_repository" {
  description = "Spacelift repository name"
  type        = string
  default     = "zinovik/boardgamegeek-bots-infrastructure"
}

variable "stack" {
  description = "Stack name"
  type        = string
  default     = "boardgamegeek-bots"
}
