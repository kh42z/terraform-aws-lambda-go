resource "aws_lambda_function" "fn" {
  depends_on    = [aws_cloudwatch_log_group.log_group, null_resource.gobuild]
  filename      = "${var.src_path}/${random_uuid.lambda_src_hash.result}.zip"
  function_name = var.name
  role          = aws_iam_role.lambda.arn
  runtime       = "go1.x"
  handler       = "main"
  timeout       = var.timeout
  environment {
    variables = var.env_variables
  }
  dynamic "vpc_config" {
    for_each = var.vpc_config == null ? [] : [0]
    content {
      security_group_ids = var.vpc_config.security_group_ids
      subnet_ids         = var.vpc_config.subnet_ids
    }
  }
}

resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = 7
}
