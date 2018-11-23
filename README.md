> Terraform module for simplified management of Shared Storage servers using Amazon EFS

<p align="center">
    <a href="LICENSE.md">
      <img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square" alt="Software License">
    </a>
    <a href="https://www.paypal.me/anmolnagpal">
      <img src="https://img.shields.io/badge/PayPal-Buy%20Me%20A%20BEER-blue.svg?style=flat-squares" alt="Donate">
    </a>
  </p>
</p>

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "efs" {
  source     = "git::https://github.com/anmolnagpal/terraform-aws-efs.git?ref=master"
  managedby  = "global"
  name       = "app"
  env        = "prod"
  attributes = ["efs"]

  aws_region         = "${var.aws_region}"
  vpc_id             = "${var.vpc_id}"
  subnets            = "${var.private_subnets}"
  availability_zones = ["${var.availability_zones}"]
  security_groups    = ["${var.security_group_id}"]

}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `policy` or `role`) | list | `<list>` | no |
| availability_zones | Availability Zone IDs | list | - | yes |
| aws_region | AWS region ID | string | - | yes |
| delimiter | Delimiter to be used between `name`, `namespace`, `stage`, etc. | string | `-` | no |
| name | Name (_e.g._ `app` or `wordpress`) | string | `app` | no |
| namespace | Namespace (_e.g._ `cp` or `anmolnagpal`) | string | `global` | no |
| security_groups | AWS security group IDs to allow to connect to the EFS | list | - | yes |
| stage | Stage (_e.g._ `prod`, `dev`, `staging`) | string | `default` | no |
| subnets | AWS subnet IDs | list | - | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | map | `<map>` | no |
| vpc_id | AWS VPC ID | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| dns_name | DNS name |
| id | EFS id |
| mount_target_ids | List of IDs of the EFS mount targets (one per Availability Zone) |
| mount_target_ips | List of IPs of the EFS mount targets (one per Availability Zone) |


- Refrence :
    - https://aws.amazon.com/efs
    - https://github.com/aws/efs-utils

## 👬 Contribution
- Open pull request with improvements
- Discuss ideas in issues

- Reach out with any feedback [![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/anmol_nagpal.svg?style=social&label=Follow%20%40anmol_nagpal)](https://twitter.com/anmol_nagpal)

