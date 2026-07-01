variable "name" {
  description = "SSM parameter name."
  type        = string
}

variable "note" {
  description = "A NORMAL (non-sensitive) input variable — safe to commit, shown in plan output."
  type        = string
  default     = ""
}

variable "secret_note" {
  description = "A SENSITIVE input variable — injected as TF_VAR_secret_note from a vault; redacted from plan output."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags applied to the parameter."
  type        = map(string)
  default     = {}
}
