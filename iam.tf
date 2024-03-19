resource "aws_iam_role" "tag_instance_function_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = ["lambda.amazonaws.com"]
      }
      Action = ["sts:AssumeRole"]
    }]
  })

  inline_policy {
    name = "root"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Effect   = "Allow"
        Action   = ["*"]
        Resource = ["*"]
      }]
    })
  }
}

resource "aws_iam_group" "ec2_instance_group" {
  name = var.ec2_instance_group_name
}

resource "aws_iam_policy" "ec2_restriction_policy" {
  name = var.policy_name
  path = "/"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "LaunchEC2Instances"
      Effect = "Allow"
      Action = [
        "ec2:Describe*",
        "ec2:RunInstances"
      ]
      Resource = ["*"]
      }, {
      Sid    = "AllowActionsIfYouAreTheOwner"
      Effect = "Allow"
      Action = [
        "ec2:StopInstances",
        "ec2:StartInstances",
        "ec2:RebootInstances",
        "ec2:TerminateInstances"
      ]
      Resource = ["*"]
      Condition = {
        StringEquals = {
          "ec2:ResourceTag/PrincipalId" = data.aws_caller_identity.current.user_id
        }
      }
    }]
  })
}

resource "aws_iam_group_policy_attachment" "attach_s3_read_policy" {
  group      = aws_iam_group.ec2_instance_group.name
  policy_arn = aws_iam_policy.ec2_restriction_policy.arn
}
