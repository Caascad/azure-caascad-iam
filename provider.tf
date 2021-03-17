
terraform {
  required_version = ">= 0.12.0"

  required_providers {
    azurerm = {
      version = ">= 2.51.0"
    }
  }
}

provider azurerm {
  features {}
}
