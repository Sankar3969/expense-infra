# mysql security group creation varibles
variable Ingress-alb {
  default     = "Ingress-alb"
}
variable Ingress_alb_desc {
  type        = string
  default     = "This security group for Ingress-alb"
}

variable Ingress_alb_tags {
  default     = {
    Environment = "dev-Ingress-alb"
  }
}
variable expense {
  default     = "expense"
}

variable Environment{
  default = "dev"
}

variable Project{
  default = "expense"
}

variable common_tags {
  type        = map(string)
  default     = {
    Project   = "Expense"
    Terraform = true
  }

}

variable zone_name {
  type        = string
  default     = "sankardevops.shop"
 
}

