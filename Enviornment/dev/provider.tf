terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "18bbb1ca-f79e-49b4-8669-5a1208da00f7"
  tenant_id = "407dc78a-27b9-4960-82a2-b6c2ceec58f6"

}
