resource "tls_private_key" "mynewkey_for_hadoop" {
  algorithm = "RSA"
  rsa_bits  = 4096
}