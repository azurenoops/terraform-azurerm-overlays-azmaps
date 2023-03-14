# Azure Sql Overlay Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![MIT License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/azurenoops/overlays-azmaps/azurerm/)

This Overlay terraform module can create a an [Azure Maps](https://docs.microsoft.com/en-us/azure/azure-maps/azure-maps-overview) account with [Azure Maps Creator](https://docs.microsoft.com/en-us/azure/azure-maps/azure-maps-create-data) and [Azure Maps Data Reader](https://docs.microsoft.com/en-us/azure/azure-maps/azure-maps-create-data) roles to be used in a [SCCA compliant Network](https://registry.terraform.io/modules/azurenoops/overlays-hubspoke/azurerm/latest).

## SCCA Compliance

This module can be SCCA compliant and can be used in a SCCA compliant Network. Enable private endpoints and SCCA compliant network rules to make it SCCA compliant.

For more information, please read the [SCCA documentation]("https://www.cisa.gov/secure-cloud-computing-architecture").

## Contributing

If you want to contribute to this repository, feel free to to contribute to our Terraform module.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Resources Used

* [Azure Maps Account](https://www.terraform.io/docs/providers/azurerm/r/maps_account.html)
* [Azure Resource Locks](https://www.terraform.io/docs/providers/azurerm/r/management_lock.html)

## Limitations

* Make sure to enable azure service map creator

## Overlay Module Usage for basic azure maps account

```hcl
module "mod_azmaps" {
  source  = "azurenoops/overlays-azmaps/azurerm"
  version = "x.x.x"

  create_maps_resource_group = true
  location                   = module.mod_azure_region_lookup.location_cli
  environment                = "public"
  deploy_environment         = "dev"
  org_name                   = "anoa"
  workload_name              = "dev-maps"

  sku = "S0"
  storage_units = 1

  # Tags for Azure Resources
  add_tags = {
    type = "basic_maps"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurenoopsutils"></a> [azurenoopsutils](#requirement\_azurenoopsutils) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.22 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurenoopsutils"></a> [azurenoopsutils](#provider\_azurenoopsutils) | ~> 1.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.22 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mod_azure_region_lookup"></a> [mod\_azure\_region\_lookup](#module\_mod\_azure\_region\_lookup) | azurenoops/overlays-azregions-lookup/azurerm | ~> 1.0.0 |
| <a name="module_mod_maps_rg"></a> [mod\_maps\_rg](#module\_mod\_maps\_rg) | azurenoops/overlays-resource-group/azurerm | ~> 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_maps_account.maps_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/maps_account) | resource |
| [azurerm_maps_creator.maps_creator](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/maps_creator) | resource |
| [azurenoopsutils_resource_name.maps_account](https://registry.terraform.io/providers/azurenoops/azurenoopsutils/latest/docs/data-sources/resource_name) | data source |
| [azurenoopsutils_resource_name.maps_creator](https://registry.terraform.io/providers/azurenoops/azurenoopsutils/latest/docs/data-sources/resource_name) | data source |
| [azurerm_resource_group.rgrp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_tags"></a> [add\_tags](#input\_add\_tags) | Map of custom tags. | `map(string)` | `{}` | no |
| <a name="input_create_maps_resource_group"></a> [create\_maps\_resource\_group](#input\_create\_maps\_resource\_group) | Controls if the resource group should be created. If set to false, the resource group name must be provided. Default is false. | `bool` | `false` | no |
| <a name="input_custom_resource_group_name"></a> [custom\_resource\_group\_name](#input\_custom\_resource\_group\_name) | The name of the custom resource group to create. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables. | `string` | `null` | no |
| <a name="input_default_tags_enabled"></a> [default\_tags\_enabled](#input\_default\_tags\_enabled) | Option to enable or disable default tags. | `bool` | `true` | no |
| <a name="input_deploy_environment"></a> [deploy\_environment](#input\_deploy\_environment) | The environment to deploy. It defaults to dev. | `string` | `"dev"` | no |
| <a name="input_enable_resource_locks"></a> [enable\_resource\_locks](#input\_enable\_resource\_locks) | (Optional) Enable resource locks | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The Terraform backend environment e.g. public or usgovernment | `string` | `null` | no |
| <a name="input_existing_resource_group_name"></a> [existing\_resource\_group\_name](#input\_existing\_resource\_group\_name) | The name of the existing resource group to use. If not set, the name will be generated using the `org_name`, `workload_name`, `deploy_environment` and `environment` variables. | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | n/a | yes |
| <a name="input_lock_level"></a> [lock\_level](#input\_lock\_level) | (Optional) id locks are enabled, Specifies the Level to be used for this Lock. | `string` | `"CanNotDelete"` | no |
| <a name="input_maps_account_custom_name"></a> [maps\_account\_custom\_name](#input\_maps\_account\_custom\_name) | Name of the Azure Maps Account, generated if not set | `string` | `""` | no |
| <a name="input_maps_creator_custom_name"></a> [maps\_creator\_custom\_name](#input\_maps\_creator\_custom\_name) | Name of the Azure Maps Creator, generated if not set. | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Optional prefix for the generated name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Optional suffix for the generated name | `string` | `""` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | A name for the organization. It defaults to anoa. | `string` | `"anoa"` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | (Required) The SKU of the Azure Maps Account. Possible values are S0, S1 and G2. Changing this forces a new resource to be created. | `string` | `"G2"` | no |
| <a name="input_storage_units"></a> [storage\_units](#input\_storage\_units) | (Required) The storage units to be allocated for the Azure Maps Creator. Integer values from 1 to 100, inclusive. | `number` | `10` | no |
| <a name="input_use_location_short_name"></a> [use\_location\_short\_name](#input\_use\_location\_short\_name) | Use short location name for resources naming (ie eastus -> eus). Default is true. If set to false, the full cli location name will be used. if custom naming is set, this variable will be ignored. | `bool` | `true` | no |
| <a name="input_use_naming"></a> [use\_naming](#input\_use\_naming) | Use the Azure NoOps naming provider to generate default resource name. `custom_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `false` | no |
| <a name="input_workload_name"></a> [workload\_name](#input\_workload\_name) | A name for the workload. It defaults to acr. | `string` | `"acr"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_maps_account_id"></a> [maps\_account\_id](#output\_maps\_account\_id) | n/a |
| <a name="output_maps_account_name"></a> [maps\_account\_name](#output\_maps\_account\_name) | n/a |
| <a name="output_maps_account_sku"></a> [maps\_account\_sku](#output\_maps\_account\_sku) | n/a |
| <a name="output_maps_creator_id"></a> [maps\_creator\_id](#output\_maps\_creator\_id) | n/a |
| <a name="output_maps_creator_name"></a> [maps\_creator\_name](#output\_maps\_creator\_name) | n/a |
<!-- END_TF_DOCS -->