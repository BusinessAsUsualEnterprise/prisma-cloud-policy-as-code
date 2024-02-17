variable "yaml_policies" {
    description = "Filename of the YAML file containing the policies"
    default = "custom-policies.yaml"
}

locals {
  policies = yamldecode(file("${path.module}/${var.yaml_policies}"))
}

# Take Config Policies from 'custom-policies.yaml' file and deploy to Prisma Cloud
resource "prismacloud_policy" "policies" {
    for_each = { for policy in yamldecode(file("./custom-policies.yaml")).config_policies: policy.name => policy }
    name = each.value.name
    policy_type = lower(each.value.type)
    cloud_type  = each.value.cloud
    severity = each.value.severity
    labels      = lookup(each.value, "labels", [])
    description = each.value.description

    rule {
        name = each.value.name
        rule_type = title(each.value.type)
        parameters = {
            savedSearch = false
            withIac     = lookup(each.value, "build", false) == false ? false : true         
        }

        dynamic "children" {
            for_each = lookup(each.value, "build", [])

            content {
                type           = "build"  
                recommendation = lookup(children.value, "recommendation", null)
                metadata = {
                    # "code" : file("./build_policy.yaml")
                    "code" : lookup(children.value, "policy", "")
                }
            }
        }
    }
}


