module myip {
  source  = "4ops/myip/http"
  version = "1.0.0"
}

module "Bastion_service_sg" {
 source = "terraform-aws-modules/security-group/aws"
name        = "archana_bastion_sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      rule        = "ssh-tcp"
      cidr_blocks = "49.207.216.200/32"
      description = "Ingress Rule"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Egress Rule"
    },
  ]

}

module "Private_Instance_sg" {
source = "terraform-aws-modules/security-group/aws"
name = "archana_private_sg"
vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "10.0.0.0/16"
      description = "Ingress Rule"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Egress Rule"
    },
  ]

}

module "Public_Instance_sg" {
source = "terraform-aws-modules/security-group/aws"
name = "archana_public_sg"
vpc_id=module.vpc.vpc_id
ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "49.207.216.200/32"
      description = "Ingress Rule"
    },
  ]
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Egress Rule"
    },
  ]

}
