output "iam_arn" {
  description = "iam arn of your lambda role"
  value       = aws_iam_role.lambda.arn
}

output "arn" {
  description = "arn of your lambda function"
  value       = aws_lambda_function.fn.arn
}