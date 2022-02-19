output "vpc_id" {
  value       = aws_vpc.target.id
  description = "VPC: id"
}

output "vpc_arn" {
  value       = aws_vpc.target.arn
  description = "VPC: ARN"
}

output "vpc_subnet_dmz_ids" {
  value       = [aws_subnet.dmz_a.id, aws_subnet.dmz_b.id]
  description = "VPC: subnet DMZ ids"
}

output "vpc_subnet_db_ids" {
  value       = [aws_subnet.db_a.id, aws_subnet.db_b.id]
  description = "VPC: subnet DB ids"
}

output "vpc_subnet_app_ids" {
  value       = [aws_subnet.app_a.id, aws_subnet.app_b.id]
  description = "VPC: subnet App ids"
}

output "vpc_subnet_app_cidrs" {
  value       = [aws_subnet.app_a.cidr_block, aws_subnet.app_b.cidr_block]
  description = "VPC: subnet App ids"
}

output "vpc_subnet_dmz_a_id" {
  value       = aws_subnet.dmz_a.id
  description = "VPC: subnet DMZ-A id"
}

output "vpc_subnet_dmz_b_id" {
  value       = aws_subnet.dmz_b.id
  description = "VPC: subnet DMZ-B id"
}

output "vpc_subnet_app_a_id" {
  value       = aws_subnet.app_a.id
  description = "VPC: subnet APP-A id"
}

output "vpc_subnet_app_b_id" {
  value       = aws_subnet.app_b.id
  description = "VPC: subnet APP-B id"
}

output "vpc_subnet_db_a_id" {
  value       = aws_subnet.db_a.id
  description = "VPC: subnet DB-A id"
}

output "vpc_subnet_db_b_id" {
  value       = aws_subnet.db_b.id
  description = "VPC: subnet DB-B id"
}

output "vpc_az_names" {
  value       = [data.aws_availability_zones.target.names[0], data.aws_availability_zones.target.names[1]]
  description = "VPC AZ: list of names"
}

# output "bastion_arn" {
#   value       = module.bastion.arn
#   description = "Bastion: ARN"
# }

# output "bastion_public_dns" {
#   value       = module.bastion.public_dns
#   description = "Bastion: Dynamic public DNS name"
# }

# output "bastion_public_ip" {
#   value       = module.bastion.public_ip
#   description = "Bastion: Dynamic public IP"
# }
