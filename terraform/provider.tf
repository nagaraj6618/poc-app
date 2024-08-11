terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
  required_version = ">= 0.14"
}

provider "local" {}
