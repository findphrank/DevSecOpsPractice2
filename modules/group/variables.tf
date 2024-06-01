variable "group_name" {
  description = "name of group to be created"
  type = string
}

variable "managed_policies_to_attach" {
  description = "list of AWS managed policies arn to attach to created group"
  type = list(any)
  default = []
}

variable "inline_policy_to_attach" {
  description = "Inline policies to attach to the created group"
  type = string
  default = null
}

variable "policy_name" {
  description = "Name to be given to inline policy created"
  type = string
  default = null
}

variable "policy_description" {
  type = string
  default = null
}

variable "region" {
  type = string
}