resource_group = {

  rg_1 = {
    name     = "rg-prod"
    location = "centralindia"
  }
}

virtual_networks = {

  vnet_1 = {
    name                = "vnet-sks"
    location            = "centralindia"
    resource_group_name = "rg-prod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {

  subnet_1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-sks"
    address_prefixes     = ["10.0.1.0/24"]

  }
  subnet_2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-prod"
    virtual_network_name = "vnet-sks"
    address_prefixes     = ["10.0.2.0/24"]

  }
}

public_ip = {

  pip_1 = {
    name                = "acceptanceTestPublicIp1"
    resource_group_name = "rg-prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
   pip_2 = {
    name                = "backendTestPublicIp1"
    resource_group_name = "rg-prod"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

network_interface = {

  nic_1 = {
    name                = "example-nic"
    location            = "centralindia"
    resource_group_name = "rg-prod"
    subnet_name         = "frontend-subnet"
    vnet_name           = "vnet-sks"
    pip_name            = "acceptanceTestPublicIp1"
  }
   nic_2 = {
    name                = "backend-nic"
    location            = "centralindia"
    resource_group_name = "rg-prod"
    subnet_name         = "backend-subnet"
    vnet_name           = "vnet-sks"
    pip_name            = "backendTestPublicIp1"
  }
}
vartual_machine = {
  vm_1 = {
    name                            = "linux-vm1"
    resource_group_name             = "rg-prod"
    location                        = "centralindia"
    size                            = "Standard_D2s_v3"
    admin_username                  = "azurerm"
    admin_password                  = "Vodafone@12345"
    nic_name                        = "example-nic"
  }
    vm_2 = {
    name                            = "linux-vm2"
    resource_group_name             = "rg-prod"
    location                        = "centralindia"
    size                            = "Standard_D2s_v3"
    admin_username                  = "azurerm"
    admin_password                  = "Vodafone@12345"
    nic_name                        = "backend-nic"
  }
}