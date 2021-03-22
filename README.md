# azure-caascad-iam

This repository contains the definition of IAM roles to create in azure tenants managed by Caascad.

The stack is deployed using `Terraform`.

## Terraform

The code is located in every `*.tf` file.

You can apply this code directly or you can use it as a `terraform` module in
your own provisioning.

For more information regarding the `terraform` code, please look at the [TERRAFORM.md](./TERRAFORM.md) file.

### Installing terraform

The code is compatible with `terraform 0.12.X` and later versions. You can find pre-built
binaries of `terraform` [here](https://releases.hashicorp.com/terraform/) or you
can install it using a package manager (depending of your system).

### Terraform state

`terraform` manage a state file which track the different resources that you
have created with `terraform`.

By default the state file is stored locally (local backend).

Multiple users can't manage the same `terraform` configuration if they don't
share the state between them.

If you need to share the state file between multiple users you need to
configure [explicitely some remote
backend](https://www.terraform.io/docs/backends/types).

You can add a file describing the `backend` you want to use (for example in a file named `override.tf`).

### Initialize terraform

Once you have installed `terraform` and configured a backend, run:

```sh
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching ">= 2.51.0"...
- Installing hashicorp/azurerm v2.51.0...
- Installed hashicorp/azurerm v2.51.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

`terraform` will automatically download the Azurerm provider.

### Azure credentials

To `apply` or `plan` the `terraform` configuration you need to provide Azure credentials to the `terraform` provider.

Multiple options are available to do this. See the [documentation of the Azurerm
provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
for more information.

We recommand using the Azure CLI to configure the `terraform` provider.
To do that, make sure you're logged in prior to the `terraform` execution and that the correct subscription is set :
```sh
# Check if the current subscription is the one you want to deploy the stack on
$ az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "00000000-0000-0000-0000-000000000000",
  "id": "00000000-0000-0000-0000-000000000000",
  "isDefault": true,
  "managedByTenants": [],
  "name": "<MY_SUBSCRIPTION>",
  "state": "Enabled",
  "tenantId": "00000000-0000-0000-0000-000000000000",
  "user": {
    "name": "<MY_USER",
    "type": "user"
  }
}

# If it is not change it
$ az account list
$ az account set --subscription "<SUBSCRIPTION_ID>"

```

### Configuring inputs

This `terraform` configuration needs a few inputs that will be provided to you by the Caascad team:

* `caascad_tenant_id`: ID of the Caascad tenant to setup the delegation
* `caascad_authorizations`: List of authorizations describing which Caascad user groups are allowed to access your resources and the associated roles.

This will be already in a `.tfvars` format, so you just have to create a `terraform.tfvars` file and put the content in it. It will normally look like this :

```tf
caascad_tenant_id = "<TENANT_ID>"

caascad_authorizations = [
  <LIST_OF_AUTHORIZATIONS>
]
```

### Planning terraform changes

Before trying to `apply` the configuration you can run a `plan` that will show
you what will be provisioned on your Azure tenant:

```sh
$ terraform plan
...
```

If all goes well you can run `apply`:

```sh
$ terraform apply
...
```
