variable "name" {
  description = "name of your lambda"
  type        = string
}

variable "env_variables" {
  description = "environments variables of your lambda"
  type        = map(string)
}

variable "src_path" {
  description = "path of your lambda sources"
  type        = string
}

variable "iam_policy_json" {
  description = "iam policy of your lambda"
  type        = string
}

variable "vpc_config" {
  description = "optional vpc of your lambda"
  type = object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  })
  default = null
}

variable "timeout" {
  description = "execution timeout of your lambda"
  default     = 60
  type        = number
}