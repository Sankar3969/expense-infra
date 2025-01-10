module "mysql_sg" {
   source          = "D:/devops/repos/Terraform_Topics/Terraform/aws_sg_group"
   Environment     = var.Environment
   sg_type         = var.mysql
   sg_tags         = var.mysql_tags
   description     = var.mysql_desc
   vpc_id          = data.aws_ssm_parameter.vpc_id.value #module.vpc.vpc
}

module "bastion_sg" {
   source          = "D:/devops/repos/Terraform_Topics/Terraform/aws_sg_group"
   Environment     = var.Environment
   sg_type         = var.bastion
   sg_tags         = var.bastion_tags
   description     = var.bastion_desc
   vpc_id          = data.aws_ssm_parameter.vpc_id.value #module.vpc.vpc
}

# Node SG
module "Node_sg" {
   source          = "D:/devops/repos/Terraform_Topics/Terraform/aws_sg_group"
   Environment     = var.Environment
   sg_type         = var.Node
   sg_tags         = var.Node_tags
   description     = var.Node_desc
   vpc_id          = data.aws_ssm_parameter.vpc_id.value #module.vpc.vpc
}
# Controle plane  SG
module "Controle_Plane_sg" {
   source          = "D:/devops/repos/Terraform_Topics/Terraform/aws_sg_group"
   Environment     = var.Environment
   sg_type         = var.Control_plane
   sg_tags         = var.Control_plane_tags
   description     = var.Control_plane_desc
   vpc_id          = data.aws_ssm_parameter.vpc_id.value #module.vpc.vpc
}
module "Ingress_Alb_sg" {
   source          = "D:/devops/repos/Terraform_Topics/Terraform/aws_sg_group"
   Environment     = var.Environment
   sg_type         = var.Ingressalb
   sg_tags         = var.Ingressalb_tags
   description     = var.Ingressalb_desc
   vpc_id          = data.aws_ssm_parameter.vpc_id.value #module.vpc.vpc
}

# This rule allow the ingressalb sg to backend  source and connection that are attached to the https
resource "aws_security_group_rule" "ingressalb-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.Ingress_Alb_sg.id
}
# This rule allow the ingress alb sg to backend  source and connection that are attached to the Node SG
resource "aws_security_group_rule" "ingressalb-Node" {
  type              = "ingress"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  source_security_group_id = module.Ingress_Alb_sg.id
  security_group_id = module.Node_sg.id
}
# from eks controle plane to Node allow all ports and all trafic
resource "aws_security_group_rule" "eks-controle-Node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.Controle_Plane_sg.id
  security_group_id = module.Node_sg.id
}
# from eks controle plane to Node allow all ports and all trafic
resource "aws_security_group_rule" "Node-eks-controle" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.Node_sg.id
  security_group_id = module.Controle_Plane_sg.id
}
# from eks controle plane to Node allow all ports and all trafic
resource "aws_security_group_rule" "vpc-Node" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["10.0.0.0/16"]
  security_group_id = module.Node_sg.id
}
resource "aws_security_group_rule" "Bastion-Node" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.Node_sg.id
}
resource "aws_security_group_rule" "Bastion-controlePlane" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  source_security_group_id = module.bastion_sg.id
  security_group_id = module.Controle_Plane_sg.id
}
# This rule allow the ansible sg to public  source and connection that are attached to the public SG
resource "aws_security_group_rule" "public_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.bastion_sg.id
}






