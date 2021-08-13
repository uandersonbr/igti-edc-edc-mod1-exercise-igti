import boto3
import pandas as pd

s3_client = boto3.client('s3')
# s3_client.download_file('datalake-uanderson-igti','Data/CAÇA AO TESOUR.pptx','data/teste.pptx')

s3_client.upload_file('data/credenciais.txt', 'datalake-uanderson-igti', 'Data/teste.txt')