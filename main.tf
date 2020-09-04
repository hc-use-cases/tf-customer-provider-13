terraform {
  required_providers {
    extip = {
      versions = ["1.0.0"]
      source = "hashicorp.com/department/extip"
    }
  }
}

data "extip" "external_ip" {
}

data "extip" "external_ip_from_aws" {
  resolver = "https://checkip.amazonaws.com/"
}

output "external_ip" {
  value = data.extip.external_ip.ipaddress
}

output "external_ip_from_aws" {
  value = data.extip.external_ip_from_aws.ipaddress
}
