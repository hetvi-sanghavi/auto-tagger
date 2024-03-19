variable "aws_region" {
  description = "AWS region for all resources."
  type        = string
  default     = "us-east-1"
}
variable "cloudtrail_name" {
  default = "Autotagging"
}
variable "event_rules" {
  type = map(object({
    name           = string
    description    = string
    source         = list(string)
    event_source   = list(string)
    event_name     = list(string)
  }))

  default = {
    rds_event_rule = {
      name          = "rds_event_rule"
      description   = "RDS Event Rule"
      source        = ["aws.rds"]
      event_source  = ["rds.amazonaws.com"]
      event_name    = ["CreateDBInstance"]
    },
    tag_event_rule = {
      name          = "tag_event_rule"
      description   = "Tag Event Rule"
      source        = ["aws.ec2"]
      event_source  = ["ec2.amazonaws.com"]
      event_name    = ["RunInstances"]
    }
  }
}
variable "iam_role_name" {
  default = "TagInstanceFunctionRole"
}
variable "ec2_instance_group_name" {
  default = "ManageEC2InstancesGroup"
}
variable "policy_name" {
  default = "TagBasedEC2RestrictionsPolicy"
}
variable "lambda_function_name" {
  default = "TagInstanceFunction"
}