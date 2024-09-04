resource "null_resource" "run_sh_file" {
  triggers = {
    build_id = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      npm install
      npm run build
      whoami
      cp -rf /build /var/www/html
EOF
  }
}

output "name" {
  value = "Hello"
}

