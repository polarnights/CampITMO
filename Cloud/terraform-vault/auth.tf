resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

resource "vault_generic_endpoint" "user1" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/user1"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["user1"],
  "password": "useruser1"
}
EOT
}

resource "vault_generic_endpoint" "user2" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/user2"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["user2"],
  "password": "useruser2"
}
EOT
}

resource "vault_generic_endpoint" "user3" {
  depends_on           = [vault_auth_backend.userpass]
  path                 = "auth/userpass/users/user3"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["user3"],
  "password": "useruser3"
}
EOT
}
