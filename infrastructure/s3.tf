resource "aws_s3_bucket" "dl" {
    bucket = "datalake-uanderson-igti-edc-tf"
    acl = "private" 

    tags = {IES:"IGTI", CURSO:"EDC"}
    
    # serverside encription habilitar a criptografia no aws
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }

}
