resource "aws_lambda_function" "tag_instance" {
  function_name = var.lambda_function_name
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  timeout       = 60
  role          = aws_iam_role.tag_instance_function_role.arn
  filename      = "code.zip"

  source_code_hash = data.archive_file.lambda.output_base64sha256
}

resource "aws_lambda_permission" "lambda_permissions" {
  for_each = var.event_rules

  statement_id  = "AllowExecutionFromCloudWatch_${each.key}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.tag_instance.arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.combined_event_rule[each.key].arn
}