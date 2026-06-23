terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 8.0"
    }
  }

  backend "oci" {
    bucket           = "oke-terraform"
    namespace        = "axfqyu562wlb"
  }
}
