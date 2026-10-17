terraform {
   required_providers {
     regcloud = {
       source = "tf.reg.cloud/regru/regcloud"
     }
   }
 }

provider "regcloud" {
  token   = var.token
  api_url = var.api_url
}