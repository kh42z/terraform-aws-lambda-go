resource "null_resource" "gobuild" {
  triggers = {
    dependencies_versions = random_uuid.lambda_src_hash.result
  }

  provisioner "local-exec" {
    command = "cd ${var.src_path} && CGO_ENABLED=0 go build && zip -r ${random_uuid.lambda_src_hash.result}.zip main"
  }
}

resource "random_uuid" "lambda_src_hash" {
  keepers = {
    for filename in setunion(
      fileset(var.src_path, "**/*.go"),
      fileset(var.src_path, "go.*"),
    ) :
    filename => join("-", concat([var.name], [filemd5("${var.src_path}/${filename}")]))
  }
}
