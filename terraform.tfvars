resource_group_name = "rg-fleet-lab"

location = "Central India"

aks_name = "aks-fleet-lab"

dns_prefix = "fleetaks"

node_count = 1

vm_size = "Standard_D2ads_v6"

vnet_address_space = [
  "10.10.0.0/16"
]

aks_subnet_prefix = [
  "10.10.1.0/24"
]