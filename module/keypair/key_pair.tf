resource "aws_key_pair" "generated_key" {
  key_name   = var.key
  public_key = tls_private_key.mynewkey_for_hadoop.public_key_openssh
}
