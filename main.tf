terraform {
  backend "remote" {
    organization = "mamu"

    workspaces {
      name = "github-config"
    }
  }
}


provider "github" {
  token   = var.github_token
  version = "~> 3.0.0"
}

locals {
  common_labels = [
    {
      name   = "invalid"
      colour = "000000"
    }
  ]
  common_topics = [
    "hacktoberfest",
  ]
  aws_topics = [
    "aws",
    "terraform",
    "infrastructure",
    "infrastructure-as-code",
  ]
}
