
resource "local_file" "copy_build_files" {
  content = <<-EOT
    @echo off
    REM Redirect to source 
    cd ${var.source_path}

    REM Npm install command
    npm install

    REM Build
    npm run build

    REM Copy build 
    xcopy ${var.build_source_path} ${var.deploy_destination_path} /E /I /Y

    REM Delete build
    rmdir /s /q ${var.build_source_path} 
  EOT
  filename = "${path.module}/copy_file.bat"
  file_permission = "0755"
}


