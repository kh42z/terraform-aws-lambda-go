# AWS Lambda Go

Terraform module which build your lambda only when your source code changes.

## Usage

```hcl
module "lambda-go" {
  source          = "kh42z/lambda-go/aws"
  version         = 0.0.2
  name            = "example"
  src_path        = "./src"
  iam_policy_json = data.aws_iam_policy_document.example-ssm.json
  env_variables = {
    REGION      = "us-east-1"
  }
}


data "aws_iam_policy_document" "example-ssm" {
  statement {
    effect = "Allow"
    actions = [
      "ssm:GetParameter"
    ]
    resources = []
  }
}
```
