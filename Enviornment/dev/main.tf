module "rgs" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs

}

module "networking" {
  source = "../../Modules/azurerm_networking"
  vnets  = var.vnets
  depends_on =[module.rgs]
}

module "pip" {
  source = "../../Modules/azurerm_public_ip"
  pip    = var.pip

  depends_on = [
    module.rgs
  ]
}


module "key_vaults" {
  source     = "../../Modules/azurerm_key_vault"
  key_vaults = var.key_vaults
 depends_on = [
    module.rgs]
}

module "compute" {
  source = "../../Modules/azurerm_compute"
  vms    = var.vms

  depends_on = [
    module.networking,
    module.pip,module.rgs
  ]
}


module "sql_server" {
  source          = "../../Modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp"
  rg_name         = "rg-todo-app-stg"
  location        = "NorthEurope"
  admin_username  = "admin123"
  admin_password  = "P@ssw01rd@123"
  tags = {
    environment = "dev"
  }
  depends_on = [
    module.rgs
  ]
}

module "sql_db" {
  depends_on  = [module.sql_server, module.rgs]
  source      = "../../Modules/azurerm_sql_database"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags = {
    environment = "dev"
  }
  sql_db_name = "bhaweshdb"
}
