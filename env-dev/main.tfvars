vpc = {
  main = {
    cidr = "10.0.0.0/16"
    az=["us-east-1a","us-east-1b"]
    subnets= {
      public = {
        public1 = { cidr = "10.0.0.0/24", az = "us-east-1a" }
        public2 = { cidr = "10.0.1.0/24", az = "us-east-1b" }
      }
      app = {
        app1 = { cidr = "10.0.2.0/24", az = "us-east-1a" }
        app2 = { cidr = "10.0.3.0/24", az = "us-east-1b" }
      }
      db = {
        db1 = { cidr = "10.0.4.0/24", az = "us-east-1a" }
        db2 = { cidr = "10.0.5.0/24", az = "us-east-1b" }
      }
    }
  }
}




default_vpc_id= "vpc-05db4dabe04c748bf"
default_vpc_cidr="172.31.0.0/16"
default_vpc_route_table_id="rtb-00a9946a73cad2da6"

tags = {
  company_name  = "ABC TECH"
  business_unit = "Ecommerce"
  project_name  = "Robo shop"
  cost_centre   = "ecom_rs "
  created_by = "terraform"
}

env ="dev"
alb = {
  public ={
    internal =false
    lb_type = "application"
    sg_ingress_cidr = ["0.0.0.0/0"]
    sg_port = 80
  }
  private ={
    internal = false
    lb_type = "application"
    sg_ingress_cidr = ["172.31.0.0/16", "10.0.0.0/16"]
    sg_port= 80

  }
}