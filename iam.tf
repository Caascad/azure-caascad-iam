resource "azurerm_lighthouse_definition" "caascad_delegation" {
  name               = "Caascad delegation"
  description        = "This is a lighthouse definition describing the delegation of resources to Caascad"
  managing_tenant_id = var.caascad_tenant_id
  scope              = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"


  dynamic "authorization" {
    for_each = var.caascad_groups_mappings
    content {
      principal_id           = authorization.value.principal_id
      role_definition_id     = authorization.value.role_definition_id
      principal_display_name = authorization.value.principal_display_name
    }
  }
}

resource "azurerm_lighthouse_assignment" "caascad_delegation" {
  scope                    = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  lighthouse_definition_id = azurerm_lighthouse_definition.caascad_delegation.id
}
