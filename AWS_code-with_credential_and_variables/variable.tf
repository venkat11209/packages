variable "rglocation" {
  type        = string
  description = "used for selecting the location"
  default     = "ap-south-1"
}

variable "acesskey" {
  type        = string
  description = "used for aws ramana account access"
}

variable "secretkey" {
  type        = string
  description = "used for aws ramana account access"
}

variable "amiid" {
  type        = string
  description = "used for selecting ami id"
}

variable "storage" {
  type        = string
  description = "used for selecting storage"
}

variable "keypairname" {
  type        = string
  description = "used for selecting keypairname"
}

