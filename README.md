# n2-disks

## Pre-requirements

- [Terraform](https://www.terraform.io/downloads)
- [Equinix Metal account](https://console.equinix.com/login)

## How to consume 

clone repository

```
git clone git@github.com:equinix-metal-use-cases/n2-disks.git
cd n2-disks
```

rename `terraform.tfvars-example` to `terraform.tfvars` and insert the project ID from the Equinix Console

create the resources

```
terraform init
terraform apply
```

login to the created device using private key

```
ssh root@<IP> -i <name-of-private-key.pem>
```

destroy the infrastructure

```
terraform destroy
```