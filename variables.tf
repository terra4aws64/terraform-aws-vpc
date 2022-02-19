variable "vpc_name" {
  type        = string
  description = "VPC: Tag: name"
  default     = "target"
  nullable    = true
  sensitive   = false
}

variable "vpc_global_cidr" {
  type        = string
  description = "VPC: CIDR"
  default     = "10.1.0.0/16"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_dmz_a" {
  type        = string
  description = "VPC: subnet CIDR for the DMZ/A subnet"
  default     = "10.1.1.0/24"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_dmz_b" {
  type        = string
  description = "VPC: subnet CIDR for the DMZ/B subnet"
  default     = "10.1.2.0/24"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_app_a" {
  type        = string
  description = "VPC: subnet CIDR for the APP/A subnet"
  default     = "10.1.3.0/24"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_app_b" {
  type        = string
  description = "VPC: subnet CIDR for the APP/B subnet"
  default     = "10.1.4.0/24"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_db_a" {
  type        = string
  description = "VPC: subnet CIDR for the APP/A subnet"
  default     = "10.1.5.0/24"
  nullable    = true
  sensitive   = false
}

variable "vpc_subnet_db_b" {
  type        = string
  description = "VPC: subnet CIDR for the APP/B subnet"
  default     = "10.1.6.0/24"
  nullable    = true
  sensitive   = false
}

variable "bastion_enabled" {
  type        = bool
  description = "Bastion: enable bastion host?"
  default     = false
  nullable    = true
}

variable "ec2_key" {
  type        = string
  description = "EC2: public SSH key"
  nullable    = true
  default     = ""
  sensitive   = true
}
