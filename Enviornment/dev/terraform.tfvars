rgs = {
  rg1 = {
    name       = "rg-todo-app-dev"
    location   = "NorthEurope"
    managed_by = "teamA-devops"
    tags = {
      environment = "development"
      project     = "todo-app"
    }
  }
  rg2 = {
    name       = "rg-todo-app-test"
    location   = "NorthEurope"
    managed_by = "teamB-devops"
    tags = {
      environment = "testing"
      project     = "todo-app"
    }
  }
}

vnets = {
  vnet = {
    name                = "vnet-todo-app-dev"
    location            = "NorthEurope"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "rg-todo-app-dev"
    tags = {
      environment = "development"
      project     = "todo-app"
    }
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pip = {
  "frontend-pip" = {
    name                = "pip-frontend-dev"
    location            = "NorthEurope"
    resource_group_name = "rg-todo-app-dev"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
  "backend-pip" = {
    name                = "pip-backend-dev"
    location            = "NorthEurope"
    resource_group_name = "rg-todo-app-dev"
    allocation_method   = "Static"
    sku                 = "Basic"
  }
}

key_vaults = {
  kv1 = {
    kv_name  = "kv-todo-app-dev"
    location = "NorthEurope"
    rg_name  = "rg-todo-app-dev"
  }
}

vms = {
  vm1 = {
    nic_name       = "nic-frontend-vm-01"
    location       = "NorthEurope"
    rg_name        = "rg-todo-app-dev"
    kv_name        = "kv-todo-app-dev"
    vnet_name      = "vnet-todo-app-dev"
    subnet_name    = "frontend-subnet"
    pip_name       = "pip-frontend-dev"
    vm_name        = "frontend-vm"
    size           = "Standard_B1s"
    admin_username = "admin123"
    admin_password = "P@ssw01rd@123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name       = "nic-backend-vm-02"
    location       = "NorthEurope"
    rg_name        = "rg-todo-app-dev"
    kv_name        = "kv-todo-app-dev"
    vnet_name      = "vnet-todo-app-dev"
    subnet_name    = "backend-subnet"
    pip_name       = "pip-backend-dev"
    vm_name        = "backend-vm"
    size           = "Standard_B1s"
    admin_username = "admin123"
    admin_password = "P@ssw01rd@123"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

