provider "github" {
  token   = var.github_token
  version = "~> 2.6.1"
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
