output "key_output" {
    value = var.key
}

output "private_key" {
    value = tls_private_key.mynewkey_for_hadoop.private_key_pem
}