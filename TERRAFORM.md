## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| azurerm | >= 2.51.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.51.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| caascad\_groups\_mappings | List of mappings to set the appropriate permissions to Caascad user groups | <pre>list(object({<br>    principal_id           = string<br>    role_definition_id     = string<br>    principal_display_name = string<br>  }))</pre> | n/a | yes |
| caascad\_tenant\_id | ID of Caascad Azure tenant | `string` | n/a | yes |

## Outputs

No output.
