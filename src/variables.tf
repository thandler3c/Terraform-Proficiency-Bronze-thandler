variable location {
  type        = string
  default     = "eastus"
  description = "The Azure region to deploy resources"
}

variable environment {
  type        = string
  description = "Name of the environment"
}

variable app_plan_sku {
  type        = string
  description = "App service sku name"
}

variable web_app_name {
  type        = string
  description = "Name of the web app"
  default     = "app-bronze-tf-001"
}