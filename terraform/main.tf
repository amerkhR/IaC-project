terraform {
   required_providers {
     regcloud = {
       source = "tf.reg.cloud/regru/regcloud"
     }
   }

   backend "local" {
    path = "/var/lib/terraform-state/terraform.tfstate"
  }
 }

provider "regcloud" {
  token   = var.token
  api_url = var.api_url
}

