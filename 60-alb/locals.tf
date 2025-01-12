locals {
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  public_subnet = split(",",data.aws_ssm_parameter.public_subnet.value)
  Ingressalb_sg     = data.aws_ssm_parameter.Ingressalb_sg.value
  aws_cert       = data.aws_ssm_parameter.aws_cert.value
}
