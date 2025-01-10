locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  private_subnet = split(",",data.aws_ssm_parameter.private_subnet.value)
  controle_plane_sg_id = data.aws_ssm_parameter.controle_plane_sg.value
  Node_sg = data.aws_ssm_parameter.Node_sg.value
}
