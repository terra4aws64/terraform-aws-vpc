data "aws_region" "target" {}

data "aws_availability_zones" "target" {
  state = "available"
}
