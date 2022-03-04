# AWS Lambda Go

Terraform module which build your lambda only when your source code changes.

## Usage

```hcl
module "lambda-go" {
  name            = "test"
  src_path        = "./src"
  iam_policy_json = data.aws_iam_policy_document.example-ssm-secrets.json
  env_variables = {
    REGION      = "us-east-1"
  }
  source = "git@github.com:kh42z/terraform-aws-lambda-go.git"
}
```
