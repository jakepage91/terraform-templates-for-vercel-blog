variable "region" {
  type        = string
  description = "AWS region"
  default     = "eu-central-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key" {
  type        = string
  description = "SSH key pair"
  default     = "KEY_NAME"
}

variable "owner" {
  type        = string
  description = "Infrastructure creator"
  default     = "NAME"
}

variable "private_key_path" {
  type        = string
  description = "Path to AWS key pair"
  default     = "/PATH/TO/PRIVATE/KEY.pem"
}

variable "ssl_arn" {
  type        = string
  description = "ACM certificate ARN"
  default     = "ACM_ARN"
}

variable "subnets" {
  type        = list(any)
  description = "Subnets IDs where Komiser will be deployed"
  default     = ["SUBNET_ID"]
}

variable "domain_name" {
  type        = string
  description = "Route53 domain name"
  default     = "DOMAIN_NAME"
}

variable "hosted_zone_id" {
  type        = string
  description = "Route53 zone ID"
  default     = "R53_ZONE_ID"
}
