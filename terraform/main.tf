resource "null_resource" "run_sh_file" {
  triggers = {
    build_id = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      npm install
      npm run build
      whoami
      ls
      cp -rf /var/lib/jenkins/workspace/poc-app/build/* /var/www/html
      echo "Finished"
EOF
  }
}

output "name" {
  value = "Hello"
}

