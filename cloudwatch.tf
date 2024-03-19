resource "aws_cloudwatch_event_rule" "combined_event_rule" {
  for_each = var.event_rules

  name        = each.value.name
  description = each.value.description

  event_pattern = jsonencode({
    source      = each.value.source,
    detail-type = ["AWS API Call via CloudTrail"],
    detail = {
      eventSource = each.value.event_source,
      eventName   = each.value.event_name
    }
  })
}

resource "aws_cloudwatch_event_target" "lambda_targets" {
  for_each = var.event_rules

  rule      = aws_cloudwatch_event_rule.combined_event_rule[each.key].name
  target_id = "SendToLambda"
  arn       = aws_lambda_function.tag_instance.arn
}