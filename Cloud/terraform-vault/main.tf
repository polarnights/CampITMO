variable "VAULT_ADDR" {
  type = string
}

variable "VAULT_TOKEN" {
  type = string
}

provider "vault" {
  address = var.VAULT_ADDR
  token   = var.VAULT_TOKEN
}
