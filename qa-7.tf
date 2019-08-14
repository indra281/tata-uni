module "web-server" {
  source = ".//modules//instances/web"
  subnet-pub = "${module.network.subnet-id-pub}"
  count  = "7"
  web-srv-image = "image-1-my-custom"
  
}

module "network" {
  source = ".//modules//network//vpc"
  
}

