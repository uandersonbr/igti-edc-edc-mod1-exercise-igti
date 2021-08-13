# HCL - Hashicorp Configuration Language
# Linguagem declarativa


resource "aws_s3_bucket" "datalake" {
    #Parametros de configuração do recurso escolhido    
    
    #nome bucket
    bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
    #controle de acesso
    acl = "private" 

    # serverside encription habilitar a criptografia no aws
    server_side_encryption_configuration {
      rule {
        apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
        }
      }
    }

    tags = {IES:"IGTI"}

}

#subindo um arquivo para a nuvem
resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key = "emr-code/pyskpark/job_spark_from_tf.py"
  acl = "private"
  source = "../job_spark.py"
  etag = filemd5("../job_spark.py")
}


provider "aws" {
  region = "${var.region}"
}