data "aws_ssm_parameter" "vpc_id" {
  name = "/expense/dev/vpc_id"
}
data "aws_ssm_parameter" "private_subnet" {
  name = "/expense/dev/private_sub"
}
data "aws_ssm_parameter" "controle_plane_sg" {
  name = "/Expense/dev/Control_plane-sg"
}
data "aws_ssm_parameter" "Node_sg" {
  name = "/Expense/dev/Node-sg"
}



