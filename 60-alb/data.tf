data "aws_ssm_parameter" "vpc_id" {
  name = "/expense/dev/vpc_id"
}
data "aws_ssm_parameter" "public_subnet" {
  name = "/expense/dev/public_sub"
}
data "aws_ssm_parameter" "Ingressalb_sg" {
  name = "/Expense/dev/Ingressalb-sg"
}
data "aws_ssm_parameter" "aws_cert" {
  name = "/expense/dev/aws_cert"
}
