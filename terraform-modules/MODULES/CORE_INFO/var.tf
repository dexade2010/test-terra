variable "required_tags" {
  description = "tag required to be specfied on all resources"
  type = object({
    environment = string
    OwnerEmail  = string
  })
  validation {
    condition     = var.required_tags.environment != "" && var.required_tags.environment == lower(var.required_tags.environment) && contains(["dev", "test", "prod", "uat"], var.required_tags.environment)
    error_message = "Environment must be a non-empty value, must be in lowercase and must be one of -dev,test,uat,prod "
  }

  validation {
    condition     = var.required_tags.OwnerEmail != "" && var.required_tags.OwnerEmail == lower(var.required_tags.OwnerEmail)
    error_message = "OwnerEmail must be a non-empty value, must be in lowercase"
  }
}