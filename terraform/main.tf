module "stackgen_00528437-7985-5c05-939e-ce42f44c207b" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "OAI for appcd-public-documentation"
}

module "stackgen_04501568-a8d5-5a0e-8e19-ec488edf2e48" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-west-2c"
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_0d72b517-c603-5b61-ad51-a9c849881b3d" {
  source               = "./modules/aws_iam_user"
  force_destroy        = null
  name                 = "registry-registry-user"
  path                 = "/"
  permissions_boundary = null
  tags = {
    created_by = "cesar@appcd.com"
  }
}

module "stackgen_0f01d082-237c-5fb0-9220-17c9a097946d" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"elasticloadbalancing.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Allows ELB to call AWS services on your behalf."
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForElasticLoadBalancing"
  path                 = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_140b98af-a9f9-53d3-9713-24478cbac3be" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "releases.stackgen.com"
  records                          = ["ns-1509.awsdns-60.org.", "ns-1687.awsdns-18.co.uk.", "ns-479.awsdns-59.com.", "ns-762.awsdns-31.net."]
  set_identifier                   = ""
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "/hostedzone/Z08084853R9JGBDMI64WN"
}

module "stackgen_17d85fdd-37fa-545c-9f7f-fdffd92300b5" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs-tasks.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "registry-task-role-policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucketMultipartUploads\",\"s3:ListBucket\",\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket\"},{\"Action\":[\"s3:PutObject\",\"s3:ListMultipartUploadParts\",\"s3:GetObject\",\"s3:DeleteObject\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket/*\"},{\"Action\":[\"ssmmessages:OpenDataChannel\",\"ssmmessages:OpenControlChannel\",\"ssmmessages:CreateDataChannel\",\"ssmmessages:CreateControlChannel\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParametersByPath\",\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/registry/*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "registry-task-role"
  path                 = "/"
  permissions_boundary = null
  tags = {
    created_by = "cesar@appcd.com"
  }
}

module "stackgen_1c1aafa5-6715-5778-90fa-813d71109ea6" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs-tasks.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "registry-exec-additional"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucketMultipartUploads\",\"s3:ListBucket\",\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket\"},{\"Action\":[\"s3:PutObject\",\"s3:ListMultipartUploadParts\",\"s3:GetObject\",\"s3:DeleteObject\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket/*\"},{\"Action\":[\"ssmmessages:OpenDataChannel\",\"ssmmessages:OpenControlChannel\",\"ssmmessages:CreateDataChannel\",\"ssmmessages:CreateControlChannel\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParametersByPath\",\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/registry/*\"}]}"
  }]
  max_session_duration = 3600
  name                 = "registry-task-execution-role"
  path                 = "/"
  permissions_boundary = null
  tags = {
    created_by = "cesar@appcd.com"
  }
}

module "stackgen_229ffa38-1cb2-5e4e-bcf4-45d84cd4329c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Role to enable Amazon ECS to manage your cluster."
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForECS"
  path                 = "/aws-service-role/ecs.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_232ca056-4e4b-5617-9f6a-e94f5427d2bb" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "docs.stackgen.com"
  records                          = ["ns-1673.awsdns-17.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  set_identifier                   = ""
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "/hostedzone/Z09014452T943NZM0PMKY"
}

module "stackgen_23565531-d194-5c76-8efa-23cd900f3e49" {
  source    = "./modules/aws_iam_role_policy"
  name      = "registry-task-role-policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucketMultipartUploads\",\"s3:ListBucket\",\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket\"},{\"Action\":[\"s3:PutObject\",\"s3:ListMultipartUploadParts\",\"s3:GetObject\",\"s3:DeleteObject\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket/*\"},{\"Action\":[\"ssmmessages:OpenDataChannel\",\"ssmmessages:OpenControlChannel\",\"ssmmessages:CreateDataChannel\",\"ssmmessages:CreateControlChannel\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParametersByPath\",\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/registry/*\"}]}"
  role      = module.stackgen_17d85fdd-37fa-545c-9f7f-fdffd92300b5.name
  role_type = "custom"
}

module "stackgen_2366503c-7f77-55ed-9423-65113408e3e9" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "enterprise-docs.stackgen.com"
  records                          = ["ns-67.awsdns-08.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  set_identifier                   = ""
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "/hostedzone/Z04727141K3LULU1P62L"
}

module "stackgen_2536e0ce-afef-59fc-834b-f6b5f671ac21" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  role       = module.stackgen_0f01d082-237c-5fb0-9220-17c9a097946d.name
}

module "stackgen_2a0df354-5c08-5870-bf8e-60dcdca51172" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_2b532fe1-73a0-56da-9e91-e85e88ce8366.arn
  role       = module.stackgen_b872bbc5-728a-5890-8fc0-46c7cd04adf1.name
}

module "stackgen_2b532fe1-73a0-56da-9e91-e85e88ce8366" {
  source      = "./modules/aws_iam_policy"
  description = ""
  name        = "CloudWatchSyntheticsPolicy-cloud-stackgen-com-he-0d7-6b5cb3439d95"
  path        = "/service-role/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:PutObject\",\"s3:GetObject\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cw-syn-results-584974133937-us-west-2/canary/us-west-2/cloud-stackgen-com-health-0d7-6b5cb3439d95/*\"]},{\"Action\":[\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::cw-syn-results-584974133937-us-west-2\"]},{\"Action\":[\"logs:CreateLogStream\",\"logs:PutLogEvents\",\"logs:CreateLogGroup\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:logs:us-west-2:584974133937:log-group:/aws/lambda/cwsyn-cloud-stackgen-com-health-*\"]},{\"Action\":[\"s3:ListAllMyBuckets\",\"xray:PutTraceSegments\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]},{\"Action\":\"cloudwatch:PutMetricData\",\"Condition\":{\"StringEquals\":{\"cloudwatch:namespace\":\"CloudWatchSynthetics\"}},\"Effect\":\"Allow\",\"Resource\":\"*\"}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_30109269-39fa-5ada-befc-396483c939a2" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"member.org.stacksets.cloudformation.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Service linked role for CloudFormation StackSets (Organization Member)"
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForCloudFormationStackSetsOrgMember"
  path                 = "/aws-service-role/member.org.stacksets.cloudformation.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_3200f664-d918-507f-b83a-79f0099d2b31" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "cw-syn-results-584974133937-us-west-2"
  force_destroy       = null
  object_lock_enabled = false
  tags                = {}
}

module "stackgen_39de21b5-c151-58d4-9727-332b5cfdee31" {
  source          = "./modules/aws_iam_openid_connect_provider"
  client_id_list  = ["sts.amazonaws.com"]
  tags            = {}
  thumbprint_list = ["a031c46782e6e6c662c2c87c76da9aa62ccabd8e"]
  url             = "token.actions.githubusercontent.com"
}

module "stackgen_3b47b96b-d021-5db5-8bdc-acb6280b8094" {
  source      = "./modules/aws_iam_policy"
  description = "IAM policy for appcd lambda function to access S3"
  name        = "appcd_lambda_releases_sync_policy"
  path        = "/"
  policy      = "{\"Statement\":[{\"Action\":[\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}],\"Version\":\"2012-10-17\"}"
  tags        = {}
}

module "stackgen_3d24aebd-2dba-5e55-bb48-948300e95584" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSSOServiceRolePolicy"
  role       = module.stackgen_60fd9656-bf5b-5d5b-af3b-8922a2209893.name
}

module "stackgen_3f2d5e0b-88a2-5692-ac49-6554dd0aad8e" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
  role       = module.stackgen_52192fa2-92b3-5411-87a8-52701564dd54.name
}

module "stackgen_42e9e2d8-ca28-5950-9b0b-3f4682b7fc7f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/CloudFormationStackSetsOrgMemberServiceRolePolicy"
  role       = module.stackgen_30109269-39fa-5ada-befc-396483c939a2.name
}

module "stackgen_45f462ee-32d4-5af9-b5a9-d62da63e713c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_6c98f164-0831-5d1b-a4e7-534183a61aea.name
}

module "stackgen_47a9236f-0c50-5776-b387-3068e4d61d42" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AccessAnalyzerServiceRolePolicy"
  role       = module.stackgen_b00c31d8-34cc-5cb6-8bac-c3569fd6a39c.name
}

module "stackgen_4a5c3d1d-1e52-589b-a1e4-8c1788354434" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = module.stackgen_ec392e11-546b-586b-a311-7e44106cfb44.name
}

module "stackgen_51a67b34-14e1-576a-a23a-c89a2973ef1c" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = module.stackgen_1c1aafa5-6715-5778-90fa-813d71109ea6.name
}

module "stackgen_52192fa2-92b3-5411-87a8-52701564dd54" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Sid\":\"AllowAwsToAssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":[\"lambda.amazonaws.com\",\"edgelambda.amazonaws.com\"]},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "lambda_execution_role"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_56ce2b20-12a0-55bf-93b8-bc2bb1d6c930" {
  source = "./modules/aws_internet_gateway"
  tags   = {}
  vpc_id = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_56e8e055-91fb-5d65-96fb-9b01bc32cfa9" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-west-2a"
  cidr_block              = "172.31.32.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_58608fc9-ce12-50cd-93a4-8dceb7fa7250" {
  source    = "./modules/aws_iam_role_policy"
  name      = "registry-exec-additional"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucketMultipartUploads\",\"s3:ListBucket\",\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket\"},{\"Action\":[\"s3:PutObject\",\"s3:ListMultipartUploadParts\",\"s3:GetObject\",\"s3:DeleteObject\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket/*\"},{\"Action\":[\"ssmmessages:OpenDataChannel\",\"ssmmessages:OpenControlChannel\",\"ssmmessages:CreateDataChannel\",\"ssmmessages:CreateControlChannel\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParametersByPath\",\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/registry/*\"}]}"
  role      = module.stackgen_1c1aafa5-6715-5778-90fa-813d71109ea6.name
  role_type = "custom"
}

module "stackgen_5dc24b0a-3f69-5ec8-9581-2e8eb2554acc" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_de347d9f-d185-5ec1-b038-dbe74dcaa624.name
}

module "stackgen_60a1a2d0-340a-56ac-9295-3c25876fac01" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = module.stackgen_3b47b96b-d021-5db5-8bdc-acb6280b8094.arn
  role       = module.stackgen_88db5f36-767a-5836-b9c5-677a8188e6d8.name
}

module "stackgen_60fd9656-bf5b-5d5b-af3b-8922a2209893" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"sso.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Service-linked role used by AWS SSO to manage AWS resources, including IAM roles, policies and SAML IdP on your behalf."
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForSSO"
  path                 = "/aws-service-role/sso.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_639d9acb-05be-53df-b0bf-480546b5e7fa" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/job-function/Billing"
  role       = module.stackgen_de347d9f-d185-5ec1-b038-dbe74dcaa624.name
}

module "stackgen_6c91b10f-b4df-53e5-99bf-02435ad674a9" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-west-2d"
  cidr_block              = "172.31.48.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_6c98f164-0831-5d1b-a4e7-534183a61aea" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::368945481389:root\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "OrganizationAccountAccessRole"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_7576cbd6-1fd0-5836-b41a-5e67c5208314" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSApplicationAutoscalingECSServicePolicy"
  role       = module.stackgen_8498980e-d2d3-5ef1-ac58-aa9e07593563.name
}

module "stackgen_774ff173-2158-534c-9987-c41ba3714ecf" {
  source = "./modules/aws_route_table"
  route = [{
    carrier_gateway_id         = ""
    cidr_block                 = "0.0.0.0/0"
    core_network_arn           = ""
    destination_prefix_list_id = ""
    egress_only_gateway_id     = ""
    gateway_id                 = "igw-06e58f95daf450f4d"
    instance_id                = ""
    ipv6_cidr_block            = ""
    local_gateway_id           = ""
    nat_gateway_id             = ""
    network_interface_id       = ""
    transit_gateway_id         = ""
    vpc_endpoint_id            = ""
    vpc_peering_connection_id  = ""
  }]
  tags   = {}
  vpc_id = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_7c2eb9dd-3748-57df-9a2f-02cb9aa5db41" {
  source           = "./modules/aws_route53_resolver_rule_association"
  name             = "System Rule Association"
  resolver_rule_id = "rslvr-autodefined-rr-internet-resolver"
  vpc_id           = "vpc-01b64ba93078aa029"
}

module "stackgen_8498980e-d2d3-5ef1-ac58-aa9e07593563" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"ecs.application-autoscaling.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForApplicationAutoScaling_ECSService"
  path                 = "/aws-service-role/ecs.application-autoscaling.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_84c2a1f1-983c-5857-ab5c-42e43d4127a6" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = ["enterprise-docs.appcd.io", "enterprise-docs.stackgen.com"]
  comment                         = null
  continuous_deployment_policy_id = null
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD", "OPTIONS"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 3600
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    lambda_function_association = [{
      event_type   = "viewer-request"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:584974133937:function:basicAuthLambda:3"
    }]
    max_ttl                    = 86400
    min_ttl                    = 0
    origin_request_policy_id   = ""
    realtime_log_config_arn    = ""
    response_headers_policy_id = ""
    smooth_streaming           = false
    target_origin_id           = "S3-appcd-enterprise-public-documentation"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
  }]
  default_root_object    = "index.html"
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts  = 3
    connection_timeout   = 10
    custom_header        = []
    custom_origin_config = []
    domain_name          = "appcd-enterprise-public-documentation.s3.us-east-2.amazonaws.com"
    origin_id            = "S3-appcd-enterprise-public-documentation"
    origin_path          = ""
    origin_shield        = []
    s3_origin_config     = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:584974133937:certificate/6122af44-e568-446a-a46d-b0b428ff2079"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_8793dd33-64ac-5cc6-b6d1-bc11596cdc46" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSLambdaReplicator"
  role       = module.stackgen_c7f8b7ee-1115-5ecf-a467-4a27f5e720d4.name
}

module "stackgen_88db5f36-767a-5836-b9c5-677a8188e6d8" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "appcd_lambda_releases_sync_role"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_8e9c9bd0-3cbb-5d60-86f3-eb5b9fd276a2" {
  source              = "./modules/aws_s3_bucket"
  bucket              = "584974133937-states"
  force_destroy       = null
  object_lock_enabled = false
  tags = {
    Attributes       = "states"
    GithubRepository = "infra"
    Name             = "584974133937-states"
    Namespace        = "584974133937"
    Terraform        = "true"
  }
}

module "stackgen_932663be-0b07-5229-80df-6580e2664d3a" {
  source  = "./modules/aws_iam_access_key"
  pgp_key = null
  status  = "Active"
  user    = module.stackgen_0d72b517-c603-5b61-ad51-a9c849881b3d.name
}

module "stackgen_93dc712b-d704-53b0-bb6f-b764d8eb5695" {
  source                          = "./modules/aws_cloudfront_distribution"
  aliases                         = ["docs.appcd.io", "docs.stackgen.com"]
  comment                         = null
  continuous_deployment_policy_id = null
  custom_error_response           = []
  default_cache_behavior = [{
    allowed_methods           = ["GET", "HEAD", "OPTIONS"]
    cache_policy_id           = ""
    cached_methods            = ["GET", "HEAD"]
    compress                  = true
    default_ttl               = 3600
    field_level_encryption_id = ""
    forwarded_values = [{
      cookies = [{
        forward           = "none"
        whitelisted_names = []
      }]
      headers                 = []
      query_string            = false
      query_string_cache_keys = []
    }]
    function_association = []
    lambda_function_association = [{
      event_type   = "viewer-request"
      include_body = false
      lambda_arn   = "arn:aws:lambda:us-east-1:584974133937:function:indexURLRewriteLambda:2"
    }]
    max_ttl                    = 86400
    min_ttl                    = 0
    origin_request_policy_id   = ""
    realtime_log_config_arn    = ""
    response_headers_policy_id = ""
    smooth_streaming           = false
    target_origin_id           = "S3-appcd-public-documentation"
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = "redirect-to-https"
  }]
  default_root_object    = "index.html"
  enabled                = true
  http_version           = "http2"
  is_ipv6_enabled        = true
  logging_config         = []
  ordered_cache_behavior = []
  origin = [{
    connection_attempts  = 3
    connection_timeout   = 10
    custom_header        = []
    custom_origin_config = []
    domain_name          = "appcd-public-documentation.s3.us-east-2.amazonaws.com"
    origin_id            = "S3-appcd-public-documentation"
    origin_path          = ""
    origin_shield        = []
    s3_origin_config     = []
  }]
  price_class = "PriceClass_All"
  restrictions = [{
    geo_restriction = [{
      locations        = []
      restriction_type = "none"
    }]
  }]
  staging = false
  tags    = {}
  viewer_certificate = [{
    acm_certificate_arn            = "arn:aws:acm:us-east-1:584974133937:certificate/4fc4b143-e5c2-4673-8308-5368d9041978"
    cloudfront_default_certificate = false
    iam_certificate_id             = ""
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }]
  wait_for_deployment = true
  web_acl_id          = ""
}

module "stackgen_9472c121-1fd9-572e-a830-318ddbef76ca" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "d2ul4bgalmmm6c.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "docs.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z09014452T943NZM0PMKY"
}

module "stackgen_990c77b3-bda5-5209-9fc1-b5583dd7bc2f" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"trustedadvisor.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_a569e057-e2d0-529b-b1f7-901c9432d3a3" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  role       = module.stackgen_ecc39dd1-e26d-5ae8-b518-31e3604e6b94.name
}

module "stackgen_a5d2713e-c504-55b0-a697-2b12ea46d94f" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "d1fczt8t2f0xm9.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "releases.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z08084853R9JGBDMI64WN"
}

module "stackgen_a5e44bbf-86a7-57b1-aac9-801f0db9067e" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "docs.stackgen.com"
  records                          = ["ns-1076.awsdns-06.org.", "ns-155.awsdns-19.com.", "ns-1673.awsdns-17.co.uk.", "ns-997.awsdns-60.net."]
  set_identifier                   = ""
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "/hostedzone/Z09014452T943NZM0PMKY"
}

module "stackgen_aa622e29-8e4f-5fff-bdbb-91e0103a3156" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSCloudFrontLogger"
  role       = module.stackgen_d66e48ba-d77f-5f54-805f-da0d37e30049.name
}

module "stackgen_acc75292-9bc9-56b6-a1aa-31f719735cf8" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"organizations.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Service-linked role used by AWS Organizations to enable integration of other AWS services with Organizations."
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForOrganizations"
  path                 = "/aws-service-role/organizations.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_acfc4a1f-1527-5560-b2cd-67297523cd94" {
  source                  = "./modules/aws_subnet"
  availability_zone       = "us-west-2b"
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  tags                    = {}
  vpc_id                  = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_aed66f9a-e10d-5dc4-8100-9a35fdad9dcf" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  role       = module.stackgen_e6c9a178-5b16-56e1-b8af-dcea2d84bc35.name
}

module "stackgen_b00c31d8-34cc-5cb6-8bac-c3569fd6a39c" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"access-analyzer.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForAccessAnalyzer"
  path                 = "/aws-service-role/access-analyzer.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_b06f9693-d764-52ef-b135-01fe519b8088" {
  source    = "./modules/aws_iam_role_policy"
  name      = "terraform-20231115043523614300000001"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Put*\",\"s3:Get*\",\"s3:DeleteObject*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-public-documentation\",\"arn:aws:s3:::appcd-public-documentation/*\",\"arn:aws:s3:::appcd-public-documentation-staging\",\"arn:aws:s3:::appcd-public-documentation-staging/*\",\"arn:aws:s3:::appcd-enterprise-public-documentation\",\"arn:aws:s3:::appcd-enterprise-public-documentation/*\",\"arn:aws:s3:::appcd-public-releases\",\"arn:aws:s3:::appcd-public-releases/*\",\"arn:aws:s3:::stackgen-public-releases\",\"arn:aws:s3:::stackgen-public-releases/*\"]}]}"
  role      = module.stackgen_c269946d-3150-507c-9a08-3fbe9412f3fd.name
  role_type = "custom"
}

module "stackgen_b872bbc5-728a-5890-8fc0-46c7cd04adf1" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "CloudWatch Synthetics lambda execution role for running canaries"
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "CloudWatchSyntheticsRole-cloud-stackgen-com-he-0d7-6b5cb3439d95"
  path                 = "/service-role/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_b8cedf07-f545-54dd-a9d1-26ce6e77f4da" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
  role       = module.stackgen_88db5f36-767a-5836-b9c5-677a8188e6d8.name
}

module "stackgen_b9a86349-70e0-5039-a4e4-d7210c509cba" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"support.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Enables resource access for AWS to provide billing, administrative and support services"
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_c269946d-3150-507c-9a08-3fbe9412f3fd" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::584974133937:oidc-provider/token.actions.githubusercontent.com\"},\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"ForAnyValue:StringLike\":{\"token.actions.githubusercontent.com:sub\":[\"repo:appcd-dev/appcd-dist:ref:refs/heads/main\",\"repo:appcd-dev/appcd-dist:pull_request\",\"repo:appcd-dev/appcd-dist:ref:refs/tags/*\",\"repo:appcd-dev/license-manager:ref:refs/heads/main\",\"repo:appcd-dev/license-manager:ref:refs/tags/*\",\"repo:appcd-dev/cloud2code:ref:refs/heads/main\",\"repo:appcd-dev/cloud2code:ref:refs/tags/*\",\"repo:appcd-dev/appcd:ref:refs/tags/*\",\"repo:appcd-dev/appcd-llm-gateway:ref:refs/tags/*\",\"repo:appcd-dev/external-docs:ref:refs/heads/main\",\"repo:appcd-dev/external-docs:pull_request\",\"repo:appcd-dev/external-docs:ref:refs/tags/*\"]}}}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = "terraform-20231115043523614300000001"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:Put*\",\"s3:Get*\",\"s3:DeleteObject*\",\"s3:List*\"],\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::appcd-public-documentation\",\"arn:aws:s3:::appcd-public-documentation/*\",\"arn:aws:s3:::appcd-public-documentation-staging\",\"arn:aws:s3:::appcd-public-documentation-staging/*\",\"arn:aws:s3:::appcd-enterprise-public-documentation\",\"arn:aws:s3:::appcd-enterprise-public-documentation/*\",\"arn:aws:s3:::appcd-public-releases\",\"arn:aws:s3:::appcd-public-releases/*\",\"arn:aws:s3:::stackgen-public-releases\",\"arn:aws:s3:::stackgen-public-releases/*\"]}]}"
  }]
  max_session_duration = 3600
  name                 = "GitHubActionsRole"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_c4d65d5f-9718-5995-86b3-4bc6f51ac2e2" {
  source            = "./modules/aws_route53_zone"
  comment           = "Managed by Terraform"
  delegation_set_id = ""
  force_destroy     = null
  name              = "docs.stackgen.com"
  tags              = {}
  vpc               = []
}

module "stackgen_c7f8b7ee-1115-5ecf-a467-4a27f5e720d4" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"replicator.lambda.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForLambdaReplicator"
  path                 = "/aws-service-role/replicator.lambda.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_c810e861-a72d-5c53-87cd-cd9754e99765" {
  source = "./modules/aws_route53_record"
  alias = [{
    evaluate_target_health = false
    name                   = "di77yd7sd4nnn.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }]
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "enterprise-docs.stackgen.com"
  records                          = []
  set_identifier                   = ""
  ttl                              = 0
  type                             = "A"
  zone_id                          = "/hostedzone/Z04727141K3LULU1P62L"
}

module "stackgen_c92fe283-5cd5-5155-bb0a-15d90a1cdeb2" {
  source            = "./modules/aws_route53_zone"
  comment           = "Managed by Terraform"
  delegation_set_id = ""
  force_destroy     = null
  name              = "enterprise-docs.stackgen.com"
  tags              = {}
  vpc               = []
}

module "stackgen_c9c80034-f5f6-5850-9a6f-a41975767589" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = {}
}

module "stackgen_c9e3454b-c72b-5624-90c2-4bb11f118e79" {
  source            = "./modules/aws_route53_zone"
  comment           = "Managed by Terraform"
  delegation_set_id = ""
  force_destroy     = null
  name              = "releases.stackgen.com"
  tags              = {}
  vpc               = []
}

module "stackgen_cbe8d7b2-5959-586d-817e-e2ff9e10a6d2" {
  source = "./modules/aws_dynamodb_table"
  attribute = [{
    name = "LockID"
    type = "S"
  }]
  billing_mode           = "PAY_PER_REQUEST"
  global_secondary_index = []
  hash_key               = "LockID"
  local_secondary_index  = []
  name                   = "584974133937-states-lock"
  point_in_time_recovery = [{
    enabled = true
  }]
  range_key     = null
  read_capacity = 0
  server_side_encryption = [{
    enabled     = true
    kms_key_arn = "arn:aws:kms:us-west-2:584974133937:key/59432d09-e432-4786-a22b-c543dad5756e"
  }]
  stream_enabled   = false
  stream_view_type = ""
  tags = {
    Attributes       = "states-lock"
    GithubRepository = "infra"
    Name             = "584974133937-states-lock"
    Namespace        = "584974133937"
    Terraform        = "true"
  }
  timeouts = {
    create = null
    delete = null
    update = null
  }
  ttl = [{
    attribute_name = ""
    enabled        = false
  }]
  write_capacity = 0
}

module "stackgen_cc39a7ef-efd2-5d36-8b41-2cd64d2992f6" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSOrganizationsServiceTrustPolicy"
  role       = module.stackgen_acc75292-9bc9-56b6-a1aa-31f719735cf8.name
}

module "stackgen_cd0b4b47-5737-5f13-b9a5-1fc9ff69802f" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = module.stackgen_b9a86349-70e0-5039-a4e4-d7210c509cba.name
}

module "stackgen_d4939ccb-31d3-534b-a32c-1710524075b0" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "enterprise-docs.stackgen.com"
  records                          = ["ns-1378.awsdns-44.org.", "ns-1730.awsdns-24.co.uk.", "ns-67.awsdns-08.com.", "ns-840.awsdns-41.net."]
  set_identifier                   = ""
  ttl                              = 172800
  type                             = "NS"
  zone_id                          = "/hostedzone/Z04727141K3LULU1P62L"
}

module "stackgen_d4cae426-693a-5630-92d4-6566f84d527f" {
  source    = "./modules/aws_iam_role_policy"
  name      = "tf-state-backend-policy"
  policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"s3:*\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::584974133937-states/*\",\"arn:aws:s3:::584974133937-states\"]},{\"Action\":\"dynamodb:*\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:us-west-2:584974133937:table/584974133937-states-lock\"}]}"
  role      = module.stackgen_e6c9a178-5b16-56e1-b8af-dcea2d84bc35.name
  role_type = "custom"
}

module "stackgen_d66e48ba-d77f-5f54-805f-da0d37e30049" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"logger.cloudfront.amazonaws.com\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "AWSServiceRoleForCloudFrontLogger"
  path                 = "/aws-service-role/logger.cloudfront.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_de347d9f-d185-5ec1-b038-dbe74dcaa624" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::584974133937:saml-provider/AWSSSO_43703593f8af338b_DO_NOT_DELETE\"},\"Action\":[\"sts:AssumeRoleWithSAML\",\"sts:TagSession\"],\"Condition\":{\"StringEquals\":{\"SAML:aud\":\"https://signin.aws.amazon.com/saml\"}}}]}"
  description           = ""
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 43200
  name                 = "AWSReservedSSO_AdministratorAccess_69f70627c69bc9c8"
  path                 = "/aws-reserved/sso.amazonaws.com/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_df67c8c1-dfb1-598b-b18a-8c7932131eb0" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = module.stackgen_990c77b3-bda5-5209-9fc1-b5583dd7bc2f.name
}

module "stackgen_e58050c8-88a5-5e0c-bad3-14658aa769e9" {
  source                 = "./modules/aws_iam_saml_provider"
  name                   = "AWSSSO_43703593f8af338b_DO_NOT_DELETE"
  saml_metadata_document = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><md:EntityDescriptor xmlns:md=\"urn:oasis:names:tc:SAML:2.0:metadata\" entityID=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy1jZGRhODA1MDU3YTg5NzI1\">\n  <md:IDPSSODescriptor WantAuthnRequestsSigned=\"false\" protocolSupportEnumeration=\"urn:oasis:names:tc:SAML:2.0:protocol\">\n    <md:KeyDescriptor use=\"signing\">\n      <ds:KeyInfo xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\">\n        <ds:X509Data>\n          <ds:X509Certificate>MIIDBjCCAe6gAwIBAgIEBwaSUDANBgkqhkiG9w0BAQsFADBFMRYwFAYDVQQDDA1hbWF6b25hd3MuY29tMQ0wCwYDVQQLDARJREFTMQ8wDQYDVQQKDAZBbWF6b24xCzAJBgNVBAYTAlVTMB4XDTIzMDcxMDAxMDg1OVoXDTI4MDcxMDAxMDg1OVowRTEWMBQGA1UEAwwNYW1hem9uYXdzLmNvbTENMAsGA1UECwwESURBUzEPMA0GA1UECgwGQW1hem9uMQswCQYDVQQGEwJVUzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANjMBXAzNoUzf9g0rC4545m2iIYIjvow8MHtVAokszO8OxXPTU/nwB66aHHqXcwx2mOnjEkkeCT8eXIiX8NYpN2/1JutNtBRXcPiSKeLSHS2b4S/ArF81h6hGTYPnYmldHKRQ922qcNO7evgkh0R5c8yeCAKjbXt6BYb5WSXixCDmfp7E+CZkWxjOy9qYGMaUwX571JhnNRpBDTaJORmSuDPHuYGwu53bJQ0Wg/d+3s9aTKCRU0Arhkf8Zqu/BdVTFzUYal8VVW8ngZ2Ei5x6TeO/a90dWDzhU5zFZmFw5S98V/a39y5CoS2q0ildOSGhLubjrLQ3ayccs229bkssY8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAoyzHHTMRIhdtjX5By0e1dhJ3P7xbI2YXnqjeF1DPASTFKSAXr4u/BHCU8pgfRNkPxLL+4qh1mRND4Yz+Y5fJc8Qc2EsZROM+ZraHOaCCaAg1Dyyd/7Obv+whRS/s0ycJHfmB270LP2af3U28DJY8ruxkebz7Gd4+fdjlxMHT90O1uT1TK5bOykWSkPMIr/MNIhaGBQb3b4WKiHCBCOKKKIkl7hmLTKqtUp1oAuPWHEefAfSW3xN6shnp2uokIS9c3vIBG+vu84U/aBMMH3+WxTC7FTJ9CkIovopQ2DJ/qpfaAfhYlJV2/Dy0a8q44XT4Da15BJ8JE+6xNbj08q786w==</ds:X509Certificate>\n        </ds:X509Data>\n      </ds:KeyInfo>\n    </md:KeyDescriptor>\n    <md:SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/logout/MzY4OTQ1NDgxMzg5X2lucy1jZGRhODA1MDU3YTg5NzI1\"/>\n    <md:SingleLogoutService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/logout/MzY4OTQ1NDgxMzg5X2lucy1jZGRhODA1MDU3YTg5NzI1\"/>\n    <md:NameIDFormat>urn:oasis:names:tc:SAML:2.0:nameid-format:persistent</md:NameIDFormat>\n    <md:SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy1jZGRhODA1MDU3YTg5NzI1\"/>\n    <md:SingleSignOnService Binding=\"urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect\" Location=\"https://portal.sso.us-east-1.amazonaws.com/saml/assertion/MzY4OTQ1NDgxMzg5X2lucy1jZGRhODA1MDU3YTg5NzI1\"/>\n  </md:IDPSSODescriptor>\n</md:EntityDescriptor>\n"
  tags                   = {}
}

module "stackgen_e6c9a178-5b16-56e1-b8af-dcea2d84bc35" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"Federated\":\"arn:aws:iam::584974133937:oidc-provider/token.actions.githubusercontent.com\"},\"Action\":\"sts:AssumeRoleWithWebIdentity\",\"Condition\":{\"StringEquals\":{\"token.actions.githubusercontent.com:aud\":\"sts.amazonaws.com\"},\"StringLike\":{\"token.actions.githubusercontent.com:sub\":\"repo:appcd-dev/infra:*\"}}}]}"
  description           = "Role assumed by the GitHub OIDC provider."
  force_detach_policies = false
  inline_policy = [{
    name   = "tf-state-backend-policy"
    policy = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":\"s3:*\",\"Effect\":\"Allow\",\"Resource\":[\"arn:aws:s3:::584974133937-states/*\",\"arn:aws:s3:::584974133937-states\"]},{\"Action\":\"dynamodb:*\",\"Effect\":\"Allow\",\"Resource\":\"arn:aws:dynamodb:us-west-2:584974133937:table/584974133937-states-lock\"}]}"
  }]
  max_session_duration = 3600
  name                 = "tooling-aws-oidc-iam-role"
  path                 = "/"
  permissions_boundary = null
  tags = {
    GithubRepository = "infra"
    Repository       = "appcd-dev/infra"
    Terraform        = "true"
  }
}

module "stackgen_ec392e11-546b-586b-a311-7e44106cfb44" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::269135526815:root\"},\"Action\":\"sts:AssumeRole\",\"Condition\":{\"StringEquals\":{\"sts:ExternalId\":\"2c085033-6c86-4f27-a3f5-1b716b3a3716\"}}}]}"
  description           = "Cross-account read-only access for Drata Autopilot"
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 43200
  name                 = "DrataAutopilotRole"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_ecc39dd1-e26d-5ae8-b518-31e3604e6b94" {
  source                = "./modules/aws_iam_role"
  assume_role_policy    = "{\"Version\":\"2012-10-17\",\"Id\":\"stacksets-exec-f0c8fb48f39560f7383d5fc6d3582666-assume-role-policy\",\"Statement\":[{\"Sid\":\"1\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::368945481389:role/aws-service-role/stacksets.cloudformation.amazonaws.com/AWSServiceRoleForCloudFormationStackSetsOrgAdmin\"},\"Action\":\"sts:AssumeRole\"}]}"
  description           = "Role created by AWSCloudFormation StackSets"
  force_detach_policies = false
  inline_policy = [{
    name   = ""
    policy = ""
  }]
  max_session_duration = 3600
  name                 = "stacksets-exec-f0c8fb48f39560f7383d5fc6d3582666"
  path                 = "/"
  permissions_boundary = null
  tags                 = {}
}

module "stackgen_f0e39c3d-0ce4-5fb6-888f-8f7969948e4a" {
  source      = "./modules/aws_security_group"
  description = "default VPC security group"
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  ingress = [{
    cidr_blocks      = []
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = true
    to_port          = 0
  }]
  name                   = "default"
  revoke_rules_on_delete = null
  tags                   = {}
  timeouts = {
    create = null
    delete = null
  }
  vpc_id = module.stackgen_c9c80034-f5f6-5850-9a6f-a41975767589.id
}

module "stackgen_f467cf78-80f1-58b4-a9b4-6a72f1b9cce7" {
  source      = "./modules/aws_iam_user_policy"
  name        = "registry-registry-user-policy"
  name_prefix = null
  policy      = "{\"Version\":\"2012-10-17\",\"Statement\":[{\"Action\":[\"s3:ListBucketMultipartUploads\",\"s3:ListBucket\",\"s3:GetBucketLocation\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket\"},{\"Action\":[\"s3:PutObject\",\"s3:ListMultipartUploadParts\",\"s3:GetObject\",\"s3:DeleteObject\",\"s3:AbortMultipartUpload\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:s3:::appcd-registry-bucket/*\"},{\"Action\":[\"ssmmessages:OpenDataChannel\",\"ssmmessages:OpenControlChannel\",\"ssmmessages:CreateDataChannel\",\"ssmmessages:CreateControlChannel\"],\"Effect\":\"Allow\",\"Resource\":\"*\"},{\"Action\":[\"ssm:GetParametersByPath\",\"ssm:GetParameters\",\"ssm:GetParameter\"],\"Effect\":\"Allow\",\"Resource\":\"arn:aws:ssm:*:*:parameter/registry/*\"}]}"
  user        = module.stackgen_0d72b517-c603-5b61-ad51-a9c849881b3d.name
}

module "stackgen_f5136a20-11e1-5b5e-8539-cf5b5a393d63" {
  source                           = "./modules/aws_route53_record"
  alias                            = []
  allow_overwrite                  = null
  geolocation_routing_policy       = []
  health_check_id                  = ""
  multivalue_answer_routing_policy = null
  name                             = "releases.stackgen.com"
  records                          = ["ns-1509.awsdns-60.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  set_identifier                   = ""
  ttl                              = 900
  type                             = "SOA"
  zone_id                          = "/hostedzone/Z08084853R9JGBDMI64WN"
}

module "stackgen_f61f8b97-5a35-5c05-9b5d-32bbc6a5a1ae" {
  source     = "./modules/aws_iam_role_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonECSServiceRolePolicy"
  role       = module.stackgen_229ffa38-1cb2-5e4e-bcf4-45d84cd4329c.name
}

module "stackgen_fa544069-4086-5c4f-adaa-b3a72112a7c1" {
  source  = "./modules/aws_cloudfront_origin_access_identity"
  comment = "OAI for appcd-public-releases"
}

