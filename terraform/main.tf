resource "local_file" "copy_build" {
  for_each = fileset(var.build_source_path, "**/*")

  source      = "${var.build_source_path}/${each.value}"
  destination = "${var.deploy_destination_path}/${each.value}"
}

resource "null_resource" "create_deploy_directory" {
  provisioner "local-exec" {
    command = "mkdir -p ${var.deploy_destination_path}"
  }

  triggers = {
    always_run = "${timestamp()}"
  }
}
