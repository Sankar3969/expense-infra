# mysql security group creation varibles
variable mysql {
  default     = "mysql"
}
variable mysql_desc {
  type        = string
  default     = "This security group for mysql"
}

variable mysql_tags {
  default     = {
    Environment = "dev-mysql"
  }
}
# Node SG Tags security group creation varibles
variable Node {
  default     = "Node"
}
variable Node_desc {
  type        = string
  default     = "This security group for Node"
}

variable Node_tags {
  default     = {
    Environment = "dev-Node"
  }
}
# Node SG Tags security group creation varibles
variable Control_plane {
  default     = "Control_plane"
}
variable Control_plane_desc {
  type        = string
  default     = "This security group for Control_plane"
}

variable Control_plane_tags {
  default     = {
    Environment = "dev-Control-plane"
  }
}
# Ingressalb SG Tags security group creation varibles
variable Ingressalb {
  default     = "Ingressalb"
}
variable Ingressalb_desc {
  type        = string
  default     = "This security group for Ingressalb desc"
}

variable Ingressalb_tags {
  default     = {
    Environment = "dev-Ingressalb"
  }
}
# backend security group creation varibles
variable backend {
  default     = "backend"
}
variable backend_desc {
  type        = string
  default     = "This security group for backend"
}

variable backend_tags {
  default     = {
    Environment = "dev-backend"
  }
}
# frontend security group creation varibles
variable frontend {
  default     = "frontend"
}
variable front_desc {
  type        = string
  default     = "This security group for frontend"
}

variable frontend_tags {
  default     = {
    Environment = "dev-frontend"
  }
}

# bastion security group creation varibles
variable bastion {
  default     = "bastion"
}
variable bastion_desc {
  type        = string
  default     = "This security group for bastion"
}
variable bastion_tags {
  default     = {
    Environment = "dev-bastion"
  }
}
# ansible security group creation varibles
variable ansible {
  default     = "ansible"
}
variable ansible_desc {
  type        = string
  default     = "This security group for ansible"
}
variable ansible_tags {
  default     = {
    Environment = "dev-ansible"
  }
}

# app_alb security group creation varibles
variable app_alb {
  default     = "app_alb"
}
variable app_alb_desc {
  type        = string
  default     = "This security group for app_alb"
}
variable app_alb_tags {
  default     = {
    Environment = "dev-app_alb"
  }
}
# vpn security group creation varibles
variable vpn {
  default     = "vpn"
}
variable vpn_desc {
  type        = string
  default     = "This security group for vpn"
}
variable vpn_tags {
  default     = {
    Environment = "dev-vpn"
  }
}
# web security group creation varibles
variable web_alb {
  default     = "web_alb"
}
variable web_desc {
  type        = string
  default     = "This security group for web"
}
variable web_tags {
  default     = {
    Environment = "dev-web"
  }
}


variable Environment{
  default = "dev"
}


