variable "konnect_token" {
  description = "Personal Access Token for Konnect"
  type        = string
  sensitive   = true
}

variable "konnect_api_url" {
  description = "Konnect API URL"
  type        = string
  default     = "https://au.api.konghq.com"
}

variable "workshop_customer_name" {
  description = "The name of the customer for the workshop"
  type        = string
  default     = "DataAction Workshop"
  
}
variable "dev_portal_sample_baseurl" {
  description = "Base URL for the dev portal sample APIs"
  type        = string
  default     = "https://localhost:8000"
}