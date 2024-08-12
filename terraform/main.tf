
resource "null_resource" "build_files" {
  provisioner "local-exec"{
    command = <<-EOT
    start  npm install && npm run build
    start xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y
  EOT
  }
}

resource "null_resource" "copy_files" {
  provisioner "local-exec"{
    command = <<-EOT
    start xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y
  EOT
  }
}
output "server_url" {
  value = "http://localhost:8041"
}


