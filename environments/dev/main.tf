module "vpc" {
  source        = "../../modules/vpc"
  vpc_cidr      = "10.0.0.0/16"
  subnet_cidr   = "10.0.1.0/24"
  subnet_az     = "${var.aws_region}a"         
  env           = "dev"
}
module "ec2" {
  source            = "../../modules/Ec2"
  ami_id            = "ami-0ecb62995f68bb549"
  instance_type     = "t3.micro"
  subnet_id         = module.vpc.subnet_id
  ec2_count         = 3
  env               = "dev"
}