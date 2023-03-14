# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

output "maps_account_name" {
  value = azurerm_maps_account.maps_account.name
}

output "maps_account_id" {
  value = azurerm_maps_account.maps_account.id
}

output "maps_account_sku" {
  value = azurerm_maps_account.maps_account.sku_name
}

output "maps_creator_name" {
  value = azurerm_maps_creator.maps_creator.name
}

output "maps_creator_id" {
  value = azurerm_maps_creator.maps_creator.id
}


