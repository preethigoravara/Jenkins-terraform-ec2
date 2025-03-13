module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "key_pair" {
  source      = "./modules/key-pair"
  key_name    = "my-key-preethi"
  public_key  = file("./id_rsa.pub")
}

module "ec2" {
  source                 = "./modules/ec2"
  ami                    = var.ami  # <-- Fix: Pass the `ami` variable explicitly
  subnet_id              = module.subnet.public_subnet_id
  security_group_id      = module.security_group.security_group_id
  key_name               = module.key_pair.key_name
}
