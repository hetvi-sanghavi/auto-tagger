## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.cdi_splunk_cloudtrail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_cloudwatch_event_rule.combined_event_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.lambda_targets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_group.ec2_instance_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_policy_attachment.attach_s3_read_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.ec2_restriction_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.tag_instance_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_lambda_function.tag_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.lambda_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |
| [aws_s3_bucket.s3_bucket_cloud_trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [archive_file.lambda](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region for all resources. | `string` | `"us-east-1"` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | n/a | `string` | `"Autotagging"` | no |
| <a name="input_ec2_instance_group_name"></a> [ec2\_instance\_group\_name](#input\_ec2\_instance\_group\_name) | n/a | `string` | `"ManageEC2InstancesGroup"` | no |
| <a name="input_event_rules"></a> [event\_rules](#input\_event\_rules) | n/a | <pre>map(object({<br>    name         = string<br>    description  = string<br>    source       = list(string)<br>    event_source = list(string)<br>    event_name   = list(string)<br>  }))</pre> | <pre>{<br>  "rds_event_rule": {<br>    "description": "RDS Event Rule",<br>    "event_name": [<br>      "CreateDBInstance"<br>    ],<br>    "event_source": [<br>      "rds.amazonaws.com"<br>    ],<br>    "name": "rds_event_rule",<br>    "source": [<br>      "aws.rds"<br>    ]<br>  },<br>  "tag_event_rule": {<br>    "description": "Tag Event Rule",<br>    "event_name": [<br>      "RunInstances"<br>    ],<br>    "event_source": [<br>      "ec2.amazonaws.com"<br>    ],<br>    "name": "tag_event_rule",<br>    "source": [<br>      "aws.ec2"<br>    ]<br>  }<br>}</pre> | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | n/a | `string` | `"TagInstanceFunctionRole"` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | n/a | `string` | `"TagInstanceFunction"` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | n/a | `string` | `"TagBasedEC2RestrictionsPolicy"` | no |

## Outputs

No outputs.
