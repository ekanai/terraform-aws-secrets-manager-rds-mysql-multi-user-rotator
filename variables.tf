variable "kms_key_arn" {
  type        = string
  description = "KMS ARN for Secrets Manager"
}

variable "db_cluster_name" {
  type        = string
  description = "Database Cluster Name"
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
