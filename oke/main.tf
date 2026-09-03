terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 9.0"
    }
  }

  backend "oci" {
    bucket           = "oke-terraform"
    namespace        = "axfqyu562wlb"
  }
}
