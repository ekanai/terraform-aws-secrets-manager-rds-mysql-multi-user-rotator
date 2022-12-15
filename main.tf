data "aws_region" "current" {}

data "aws_serverlessapplicationrepository_application" "multi_user_rotator" {
  application_id = "arn:aws:serverlessrepo:us-east-1:297356227824:applications/SecretsManagerRDSMySQLRotationMultiUser"
}

resource "aws_serverlessapplicationrepository_cloudformation_stack" "rotate_stack" {
  name             = "rds-${var.db_cluster_name}-multi-user-rotator"
  application_id   = data.aws_serverlessapplicationrepository_application.multi_user_rotator.application_id
  semantic_version = data.aws_serverlessapplicationrepository_application.multi_user_rotator.semantic_version
  capabilities     = data.aws_serverlessapplicationrepository_application.multi_user_rotator.required_capabilities

  parameters = {
    endpoint              = "https://secretsmanager.${data.aws_region.current.name}.amazonaws.com"
    functionName          = var.lotator_lambda_function_name
    kmsKeyArn             = var.kms_key_arn
    masterSecretArn       = var.master_secretsmanager_arn
    masterSecretKmsKeyArn = var.master_secretsmanager_kms_key_arn
    vpcSubnetIds          = join(",", var.lambda_subnet_ids)
    vpcSecurityGroupIds   = var.lambda_security_group_id
  }
}
