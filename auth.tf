terraform {
  required_providers {
    konnect = {
      source  = "kong/konnect"
      version = "3.2"
    }
  }
}

provider "konnect" {
  personal_access_token = var.konnect_token
  server_url            = "https://au.api.konghq.com"
}