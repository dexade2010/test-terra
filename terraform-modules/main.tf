#TAGGING
module "CORE-INFO" {
  source = "./STACK-MODULES/CORE_INFO"
  required_tags = {
    environment = var.environment
    OwnerEmail  = var.OwnerEmail
  }
}