resource "null_resource" "create_deploy_directory" {
  provisioner "local-exec" {
    command = "powershell -Command \"New-Item -ItemType Directory -Force -Path '${var.deploy_destination_path}'\""
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "copy_build_files" {
  depends_on = [null_resource.create_deploy_directory]

  provisioner "local-exec" {
    command = <<EOT
powershell -Command "xcopy '${replace(var.build_source_path, "\\\\$", "")}' '${replace(var.deploy_destination_path, "\\\\$", "")}' /E /I /Y"
EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}

