locals {
  projects = {
    ovh-dns-zone = {
      description = "sample Terraform project which manages an OVH DNS zone"
      avatar      = "avatars/logo-ovhcloud.png"
    }
    aws-instances = {
      description = "sample Terraform project which manages EC2 instances exposed by a load-balancer"
      avatar      = "avatars/logo-aws.png"
    }
    scaleway-k8s-cluster = {
      description = "sample Terraform project which creates a k8s cluster on Scaleway Cloud"
      avatar      = "avatars/logo-scaleway.png"
    }
    gitlab-group = {
      description = "sample Terraform project which creates a GitLab group and some projects"
      avatar      = "avatars/logo-gitlab.png"
    }
    github-organization = {
      description = "sample Terraform project which manages a GitHub organization"
      avatar      = "avatars/logo-github.png"
    }
    gcp-database = {
      description = "sample Terraform project which manages a PostgreSQL database on GCP"
      avatar      = "avatars/logo-cloudsql.png"
    }
    mongodb-atlas-cluster = {
      description = "sample Terraform project which manages a MongoDb Atlas Cluster"
      avatar      = "avatars/logo-mongodb.png"
    }
  }
}

resource "gitlab_group" "terraform_code_examples" {
  name        = "ENI Terraform Book Samples"
  path        = "eni-terraform-samples"
  description = "A GitLab group for Terraform code samples"

  avatar      = "avatars/logo-eni.png"
  avatar_hash = filesha256("avatars/logo-eni.png")

  visibility_level = "public"
}

resource "gitlab_project" "project" {
  for_each = local.projects

  name        = each.key
  description = each.value.description

  avatar      = each.value.avatar
  avatar_hash = filesha256(each.value.avatar)

  visibility_level = "public"

  namespace_id = gitlab_group.terraform_code_examples.id
}
