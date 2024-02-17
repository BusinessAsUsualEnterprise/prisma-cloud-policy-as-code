provider "prismacloud" {
    json_config_file = ".prismacloud_auth.json"
}

terraform {
  required_providers {
    prismacloud = {
        source = "PaloAltoNetworks/prismacloud"
    }
  }
}