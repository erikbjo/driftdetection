variable "subscription_id" {
  description = "The subscription ID to use for the Azure provider"
  type        = string
  sensitive   = true
  nullable    = false

  validation {
    condition     = length(var.subscription_id) == 36
    error_message = "Subscription ID must be 36 chars long"
  }
}

variable "location" {
  description = "The location to deploy the resources to"
  default     = "norwayeast"
  type        = string

  validation {
    condition     = can(regex("norwayeast|northeurope|westeurope", var.location))
    error_message = "Location must be norwayeast, northeurope or westeurope"
  }
}

variable "subnet_count" {
  description = "The number of subnets to create"
  default     = 5
  type        = number

  validation {
    condition     = var.subnet_count > 0 && var.subnet_count < 256
    error_message = "Subnet count must be between 1 and 255"
  }
}
