resource "random_pet" "this" {
  length = 2
}

resource "tls_private_key" "key" {
  algorithm   = "RSA"
  ecdsa_curve = "P521"
}

resource "equinix_metal_project_ssh_key" "this" {
  name       = random_pet.this.id
  public_key = tls_private_key.key.public_key_openssh
  project_id = var.project_id
}

resource "local_sensitive_file" "private_key_pem" {
  content         = tls_private_key.key.private_key_pem
  filename        = "${random_pet.this.id}.pem"
  file_permission = "0600"
}

resource "equinix_metal_device" "this" {
  hostname            = random_pet.this.id
  plan                = "n2.xlarge.x86"
  metro               = "da"
  operating_system    = "ubuntu_22_04"
  billing_cycle       = "hourly"
  project_id          = var.project_id
  project_ssh_key_ids = [equinix_metal_project_ssh_key.this.id]
}