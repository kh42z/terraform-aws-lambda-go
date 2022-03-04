module "lambda-go" {
  source          = "kh42z/lambda-go/aws"
  version         = "0.0.2"
  name            = "test"
  src_path        = "./src"
  iam_policy_json = data.aws_iam_policy_document.example-ssm-secrets.json
  env_variables = {
    REGION      = "us-east-1"
    DB_PASSWORD = data.aws_ssm_parameter.example_db_password.name
  }
}

data "aws_iam_policy_document" "example-ssm-secrets" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameter"
    ]
    resources = [
      data.aws_ssm_parameter.example_db_password.arn
    ]
  }
  statement {
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey"
    ]
    resources = [
      data.aws_kms_key.example-app-kms.arn
    ]
  }
}

data "aws_ssm_parameter" "example_db_password" {
  name = "/example/prod/my_db_password"
}

data "aws_kms_key" "example-app-kms" {
  key_id = "example"
}