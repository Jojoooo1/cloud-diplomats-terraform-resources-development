terraform {
  required_version = ">= 1.5.7"

  backend "gcs" {
    bucket = "tf-state-19590"
    prefix = "terraform/state/vm/bastion"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.4"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"

  config = {
    bucket = "tf-state-19590"
    prefix = "terraform/state/network/shared-vpc"
  }
}
