variable "caascad_tenant_id" {
  type        = string
  description = "ID of Caascad Azure tenant"
}

variable "caascad_authorizations" {
  type = list(object({
    principal_id           = string
    role_definition_id     = string
    principal_display_name = string
  }))
  description = "List of authorizations to set the appropriate permissions to Caascad user groups"
}
