resource "null_resource" "npm_install" {
  provisioner "local-exec" {
    command = "npm install"
  }
}

resource "null_resource" "npm_build" {
  provisioner "local-exec" {
    command = "npm run build"
  }
  depends_on = [null_resource.npm_install]
}

resource "null_resource" "copy_build_files" {
  provisioner "local-exec" {
    command = "xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y"
  }
  depends_on = [null_resource.npm_build]
}


resource "local_file" "copy_build_files" {
  content = <<-EOT
    npm install && npm run build && xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y
  EOT
  filename = "${path.module}/copy_file.bat"
  file_permission = "0755"
}


