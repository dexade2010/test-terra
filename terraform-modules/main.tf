#TAGGING
module "CORE-INFO" {
  source = "./STACK-MODULES/CORE_INFO"
  required_tags = {
    environment = var.environment
    OwnerEmail  = var.OwnerEmail
  }
}


#Create EC2 Module
module "EC2-BASE" {
  source              = "./STACK-MODULES/EC2"
  vpc_id              = module.VPC-BASE.vpc_id
  AMIS                = var.AMIS["us-east-1"]
  instance_type       = var.instance_type
  public_subnet_1_id  = module.VPC-BASE.public_subnets_1_id
  public_subnet_2_id  = module.VPC-BASE.public_subnets_2_id
  web_app_subnet_1_id = module.VPC-BASE.web_app_subnet_1_id
  web_app_subnet_2_id = module.VPC-BASE.web_app_subnet_2_id
  efs_subnets         = [module.VPC-BASE.web_app_subnet_1_id, module.VPC-BASE.web_app_subnet_2_id]
}