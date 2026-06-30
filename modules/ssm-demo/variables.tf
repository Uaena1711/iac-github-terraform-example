variable "name" {
  description = "SSM parameter name."
  type        = string
}

variable "value" {
  description = "SSM parameter value."
  type        = string
}

variable "tags" {
  description = "Tags applied to the parameter."
  type        = map(string)
  default     = {}
}
