variable "managedby" {
  default     = "global"
  description = "Managedby (_e.g._ `cp` or `anmolnagpal`)"
}

variable "env" {
  default     = "default"
  description = "Stage (_e.g._ `prod`, `dev`, `staging`)"
}

variable "name" {
  default     = "app"
  description = "Name (_e.g._ `app` or `wordpress`)"
}

variable "security_groups" {
  type        = "list"
  description = "AWS security group IDs to allow to connect to the EFS"
}

variable "vpc_id" {
  description = "AWS VPC ID"
}

variable "aws_region" {
  description = "AWS region ID"
}

variable "subnets" {
  type        = "list"
  description = "AWS subnet IDs"
}

variable "availability_zones" {
  type        = "list"
  description = "Availability Zone IDs"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `managedby`, `env`, etc."
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`)"
}
