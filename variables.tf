variable "api_key" {
  description = "IBM Cloud API Key"
  type        = string
}

variable "region" {
  default     = "br-sao"
  description = "IBM Cloud region"
}

variable "vpc_name" {
  default     = "demo-vpc"
  description = "Name of the VPC"
}

variable "subnet_name" {
  default     = "demo-subnet"
  description = "Name of the subnet"
}

variable "zone" {
  default     = "br-sao-1"
  description = "Zone for subnet and VSI"
}

variable "vsi_name" {
  default     = "demo-vsi-teste"
  description = "Name of the virtual server instance"
}

variable "image_id" {
  default     = "r042-0eeb3d3f-ee82-46a4-990c-77a67573c919"
  description = "Image ID for VSI (Ubuntu, etc.)"
}

variable "profile" {
  default     = "bx2-4x16"
  description = "VSI profile"
}

variable "ssh_key_name" {
  default     = "demo-ssh-key"
  description = "Name of the SSH key"
}

variable "public_ssh_key" {
  description = "Your public SSH key"
  type        = string
}
