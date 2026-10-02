variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-fleet-lab"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-fleet-lab"
}

variable "dns_prefix" {
  description = "AKS DNS prefix"
  type        = string
  default     = "fleetaks"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_D2ads_v6"
}

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "aks_subnet_prefix" {
  description = "AKS subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}