output "resource_group_name" {
  value = azurerm_resource_group.aks_rg.name
}

output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "aks_location" {
  value = azurerm_kubernetes_cluster.aks.location
}

output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "aks_identity_principal_id" {
  value = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}