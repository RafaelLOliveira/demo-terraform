provider "ibm" {
  ibmcloud_api_key = var.apikey
  region           = var.region
}

resource "ibm_is_ssh_key" "ssh_key" {
  name       = var.ssh_key_name
  public_key = var.public_ssh_key
}

resource "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

resource "ibm_is_subnet" "subnet" {
  name                     = var.subnet_name
  vpc                      = ibm_is_vpc.vpc.id
  zone                     = var.zone
  total_ipv4_address_count = 128
}

resource "ibm_is_instance" "vsi" {
  name           = var.vsi_name
  vpc            = ibm_is_vpc.vpc.id
  zone           = var.zone
  image          = var.image_id
  profile        = var.profile
  keys           = [ibm_is_ssh_key.ssh_key.id]

  primary_network_interface {
    subnet = ibm_is_subnet.subnet.id
  }
}

resource "ibm_is_floating_ip" "fip" {
  name   = "vsi-floating-ip"
  target = ibm_is_instance.vsi.primary_network_interface.0.id
}
