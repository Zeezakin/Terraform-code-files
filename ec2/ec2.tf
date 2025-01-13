module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  for_each = toset(["one", "two", "three"])

  name = "instance-${each.key}"

  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"] #input security group or output in VPC
  subnet_id              = "subnet-eddcdzz4" #input subnet id or outpu in VPC 

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}