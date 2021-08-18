from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName("JobSpark")
    .getOrCreate()
)

#Ler os dados do enem 2019
enem=(
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema",True)
    .option("delimiter",";")
    .load("s3://datalake-uanderson-igti/raw-data/censo/")
)


(
    enem
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("year")
    .save("s3://datalake-uanderson-igti-edc-tf/staging-zone/censo")
)

#comentário