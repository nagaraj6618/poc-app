resource "local_file" "copy_build_files" {
  content = <<-EOT
    npm install && npm run build && sudo chmod -R 777 /var/www/html &&sudo cp -rn ${var.build_source_path}/* ${var.deploy_destination_path}
  EOT
  filename = "${path.module}/copy_file.sh"
  file_permission = "0755"
}

resource "null_resource" "run_sh_file" {
  provisioner "local-exec" {
    command = "bash copy_file.sh"
  }
  depends_on = [local_file.copy_build_files]
}

output "name" {
  value = "${path.module}/copy_file.sh"
}

