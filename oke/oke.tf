module "oke" {
  source  = "oracle-terraform-modules/oke/oci"
  version = "5.5.0"

  providers = {
    oci      = oci
    oci.home = oci.home
  }

  # Misc
  compartment_id     = var.compartment_id
  tenancy_id         = var.tenancy_ocid
  user_id            = var.user_ocid
  home_region        = var.region
  region             = var.region
  timezone           = var.timezone
  kubernetes_version = "v1.35.2"

  # Auth
  api_fingerprint = var.fingerprint
  api_private_key = var.private_key
  ssh_private_key = var.ssh_private_key
  ssh_public_key  = var.ssh_public_key

  # Networking
  create_bastion = false

  # Operator
  create_operator = false

  # Workers
  worker_is_public = true
  worker_pools = {
    np1 = {
      shape              = "VM.Standard.A1.Flex",
      ocpus              = 1,
      memory             = 6,
      size               = 2,
      boot_volume_size   = 50,
      kubernetes_version = "v1.35.2"
    }
  }

  # Security
  allow_worker_internet_access      = true
  allow_worker_ssh_access           = true
  control_plane_allowed_cidrs       = ["0.0.0.0/0"]
  control_plane_is_public           = true
  assign_public_ip_to_control_plane = true

  # Gateways
  vcn_create_service_gateway = "never"
  vcn_create_nat_gateway     = "never"
}
