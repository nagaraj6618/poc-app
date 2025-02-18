resource "null_resource" "run_sh_file" {
  triggers = {
    build_id = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOF
      npm install
      npm run build
      sudo cp -rf ${var.build_source_path}/* ${var.deploy_destination_path}
      echo "Finished"
EOF
  }
}
