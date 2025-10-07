
resource "time_rotating" "rotate" {
  rotation_months = 3
}

resource "konnect_system_account" "system_account" {
  name             = "system-account"
  description      = "This is a system account"
  konnect_managed  = false
}

resource "konnect_system_account_access_token" "system_account_token" {
  depends_on = [konnect_system_account.system_account, time_rotating.rotate]
  account_id = konnect_system_account.system_account.id
  expires_at = timeadd(time_rotating.rotate.rotation_rfc3339, "2160h") # 3 months = 3*30*24 = 2160 hours
  name       = konnect_system_account.system_account.name
}