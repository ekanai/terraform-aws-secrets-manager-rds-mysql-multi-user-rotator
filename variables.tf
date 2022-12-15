variable "name" {
  type        = string
  description = "Lotator formation stack and lambda function will be created with this name."
}

variable "kms_key_arn" {
  type        = string
  description = "KMS ARN for Secrets Manager"
}

variable "lambda_security_group_id" {
  type        = string
  description = "Lambda Security Group ID"
}

variable "lambda_subnet_ids" {
  type        = list(string)
  description = "Private Subnet IDs"
}

variable "master_secretsmanager_arn" {
  type        = string
  description = "Master User Secret ARN"
}

variable "master_secretsmanager_kms_key_arn" {
  type        = string
  description = "Master User KMS Key ARN"
}
