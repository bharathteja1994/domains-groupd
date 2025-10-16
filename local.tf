locals {
  # Group definitions for db-rtlh-di-aws-syd-dev workspace
  groups = {
    "db-rtlh-di-aws-syd-dev-admin" = {
      name               = "db-rtlh-di-aws-syd-dev-admin"
      users              = ["t.desouzacomitre@riotinto.com"]
      service_principals = ["account-admin", "artifactory-service-token-job-credentials"]
      groups             = []
    }
    "db-rtlh-di-aws-syd-dev-developer" = {
      name               = "db-rtlh-di-aws-syd-dev-developer"
      users              = []
      service_principals = []
      groups             = []
    }
    "db-rtlh-di-aws-syd-dev-user" = {
      name               = "db-rtlh-di-aws-syd-dev-user"
      users              = []
      service_principals = ["app-5v8lc7 learning-day-app", "app-5v8lc7 learning-day-chatbot", "app-5v8lc7 learning-day-data-app"]
      groups             = []
    }
    "db-rtlh-di-support-syd-dev" = {
      name               = "db-rtlh-di-support-syd-dev"
      users              = []
      service_principals = []
      groups             = []
    }
  }

  # Workspace group assignments
  workspace_assignments = var.workspace_group_assignments
}
