module "resource_group" {
  source = "../../modules/azurerm_resource_group"

  resource_group = var.resource_group

}

module "virtual_network" {
  source = "../../modules/azurerm_virtual_network"

  virtual_network = var.virtual_networks

  depends_on = [module.resource_group]

}

module "subnet" {
  source = "../../modules/azurerm_subnet"

  subnets    = var.subnets
  depends_on = [module.virtual_network]

}

module "public_ip" {
  source = "../../modules/azurerm_public_ip"

  public_ip  = var.public_ip
  depends_on = [module.resource_group]
}
module "nic" {
  source = "../../modules/azurerm_network_interface_card"

  network_interface = var.network_interface

  depends_on = [module.public_ip]

}

module "linux_virtual_machine" {
  source = "../../modules/azurerm_linux_virtual_machine"

  virtual_machine = var.vartual_machine

  depends_on = [module.nic, module.public_ip]

}

