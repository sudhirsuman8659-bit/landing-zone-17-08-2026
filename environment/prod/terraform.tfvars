resource_group = {

  rg_1 = {
    name     = "rg-sks"
    location = "centralindia"
  }
}

virtual_networks = {

  vnet_1 = {
    name                = "vnet-sks"
    location            = "centralindia"
    resource_group_name = "rg-sks"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {

  subnet_1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-sks"
    virtual_network_name = "vnet-sks"
    address_prefixes     = ["10.0.1.0/24"]

  }
}

public_ip = {

  pip_1 = {
    name                = "acceptanceTestPublicIp1"
    resource_group_name = "rg-sks"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

network_interface = {

  nic_1 = {
    name                = "example-nic"
    location            = "centralindia"
    resource_group_name = "rg-sks"
    subnet_name ="frontend-subnet"
    vnet_name = "vnet-sks"
    pip_name = "acceptanceTestPublicIp1"
  }
}
vartual_machine = {
  vm_1 = {
    name                            = "linux-vm1"
    resource_group_name             = "rg-sks"
    location                        = "centralindia"
    size                            = "Standard_D2s_v3"
    admin_username                  = "azurerm"
    admin_password                  = "Vodafone@12345"
    disable_password_authentication = ""
    nic_name                        = "example-nic"
  }
}