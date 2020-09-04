# tf-customer-provider-13
How to use customer plugins with TF 0.13

use local vagrant you might need to install dependencies for this linux box
```bash
vagrant up
vagrant ssh
```

create local directory
```bash
mkdir ~/.terraform.d/plugins/hashicorp.com/department/extip/1.0.0/linux_amd64
```

install local TF provider
```go
go get github.com/petems/terraform-provider-extip
cd ~/go/src/github.com/petems/terraform-provider-extip
make build
ls -al ~/go/bin/
```

copy provider to plugin directory
```bash
cp ~/go/bin/terraform-provider-extip ~/.terraform.d/plugins/hashicorp.com/department/extip/1.0.0/linux_amd64
```

you need to have this section in your tf code
```bash 
terraform {
  required_providers {
    extip = {
      versions = ["1.0.0"]
      source = "hashicorp.com/department/extip"
    }
  }
}
```

you should see similar output
```bash
vagrant@xenial64:/vagrant$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp.com/department/extip...
- Installing hashicorp.com/department/extip v1.0.0...
- Installed hashicorp.com/department/extip v1.0.0 (unauthenticated)

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp.com/department/extip: version = "~> 1.0.0"

Terraform has been successfully initialized!
```
