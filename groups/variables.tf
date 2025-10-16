################################################################################
# Groups Inputs
################################################################################

variable "groups" {
  type = map(object({
    name               = optional(string)
    users              = optional(set(string))
    service_principals = optional(set(string))
    groups             = optional(set(string))
  }))
  description = "Map of group objects with these parameters - group names to create, sets of users, service principals, and/or groups assigned to these groups"
  default     = {}
}

variable "workspace_group_assignment" {
  type = map(object({
    group_name  = optional(string),
    permissions = optional(list(string))
  }))
  description = "Map of group assignments with group name and list of workspace permissions (USER or ADMIN) to assign to this group"
  default     = {}

  validation {
    condition = length(var.workspace_group_assignment) != 0 ? alltrue([
      for item in toset(flatten([for assignment in var.workspace_group_assignment : assignment.permissions])) : contains(["USER", "ADMIN"], item)
      if item != null
    ]) : true
    error_message = "Please provide either 'USER' or 'ADMIN' permission level for Account group on Workspace"
  }
}

variable "workspace_id" {
  type        = string
  description = "The ID of the Databricks Workspace where Databricks Account group would be assigned"
  default     = null
}
