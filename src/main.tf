locals {

  application_abbr = "tftest"
  tags = { "Purpose" = "TF Training" }
}


# Configure Resource Gruop
module "rg" {
  source = "./modules/resource-group"

  resource_group = {
    create      = true
    name        = "rg-${local.application_abbr}-${var.location}"
    location    = var.location
    tags        = local.tags
  }
}

module "app_plan" {
  source = "./modules/service-plan-windows"

  windows_service_plan = {
    create    = true
    name      = "asp-${local.application_abbr}-${var.location}-001"
    location  = var.location
    rsg_name  = module.rg.name
    sku_name  = var.app_plan_sku
    tags      = local.tags
  }

}

module "app_service" {
  source = "./modules/web-app-windows"

  windows_web_app = {
    create          = true
    name            = var.web_app_name
    location        = var.location
    rsg_name        = module.rg.name
    tags            = local.tags
    service_plan_id = module.app_plan.id
  }

  depends_on = [
    module.app_plan
  ]

}
