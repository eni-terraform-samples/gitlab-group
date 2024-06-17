terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 17.0.0"
    }
  }
  required_version = "> 1.8"
}

provider "gitlab" {
}
