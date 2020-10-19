resource "github_repository" "github_config" {
  name             = "github-config"
  description      = "Manage GitHub configuration"
  auto_init        = true

  allow_merge_commit     = false
  delete_branch_on_merge = true
  has_issues             = true
  topics                 = local.common_topics

  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "github_config_main" {
  branch         = github_repository.github_config.default_branch
  repository     = github_repository.github_config.name
  enforce_admins = false

  required_status_checks {
    strict = true
  }

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = true
  }
}

resource "github_issue_label" "github_config" {
  for_each   = { for common_label in local.common_labels : common_label.name => common_label }
  color      = each.value.colour
  name       = each.value.name
  repository = github_repository.github_config.name
}
