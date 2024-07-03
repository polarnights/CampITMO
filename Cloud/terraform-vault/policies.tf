resource "vault_policy" "user1_policy" {
  name = "user1"
  policy = file("policies/user1.hcl")
}

resource "vault_policy" "user2_policy" {
  name = "user2"
  policy = file("policies/user2.hcl")
}

resource "vault_policy" "user3_policy" {
  name = "user3"
  policy = file("policies/user3.hcl")
}

resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("policies/admin.hcl")
}