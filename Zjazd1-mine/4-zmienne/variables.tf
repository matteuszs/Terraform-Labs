variable "sub_id" {
  type        = string
  default     = "97529777-600a-4090-995a-d38a63b5de26"
}

variable "username" {
  type        = string
  default     = "test-user"
}

variable "password" {
  type        = string
  default     = "test-pass"
  sensitive   = true
}

variable "tags" {
  type     = map
  default  = {
  }
}

