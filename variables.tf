#variable "AWS_ACCESS_KEY_ID" {}
#variable "AWS_SECRET_ACCESS_KEY" {}
#variable "AWS_DEFAULT_REGION" {}

variable "owner" {}
variable "ttl" {}

variable "vpc-fullcidr" {
    default = "172.28.0.0/16"
  description = "the vpc cidr"
}


variable "subnet1_cidr"{
        default = "172.28.10.0/24"
        description = "subnet1 cidr"
}

