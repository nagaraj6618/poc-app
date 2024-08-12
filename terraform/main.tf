resource "local_file" "copy_build_files" {
  content = <<-EOT
    npm install && npm run build && xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y
  EOT
  filename = "${path.module}/copy_file.bat"
  file_permission = "0755"
}

resource "null_resource" "run_bat_file" {
  provisioner "local-exec" {
    command = "cmd /c ${path.module}\\copy_file.bat"
  }
  depends_on = [local_file.copy_build_files]
}

output "name" {
  value = "${path.module}/copy_file.bat"
}
