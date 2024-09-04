resource "null_resource" "run_sh_file" {
  triggers = {
    build_id = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      cd /home/nagaraj-per/Desktop/poc/poc-app
      npm install
      npm run build
      whoami
EOF
  }
}

output "name" {
  value = "Hello"
}

