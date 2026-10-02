# -----------------------------
# Resource Group
# -----------------------------

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    Environment = "Dev"
    Project     = "fleet"
    ManagedBy   = "Terraform"
  }
}


# -----------------------------
# Virtual Network
# -----------------------------

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "fleet-aks-vnet"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  address_space = var.vnet_address_space

  tags = {
    Environment = "Dev"
    Project     = "fleet"
  }
}


# -----------------------------
# AKS Subnet
# -----------------------------

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.aks_rg.name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name

  address_prefixes = var.aks_subnet_prefix
}


# -----------------------------
# AKS Cluster
# -----------------------------

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  dns_prefix = var.dns_prefix

  # System Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

  # Default Node Pool
  default_node_pool {
    name = "system"

    node_count = var.node_count
    vm_size    = var.vm_size

    vnet_subnet_id = azurerm_subnet.aks_subnet.id

    type = "VirtualMachineScaleSets"

    tags = {
      Environment = "Dev"
      Project     = "fleet"
    }
  }

  # Azure CNI networking
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = "Dev"
    Project     = "fleet"
    ManagedBy   = "Terraform"
  }
}