from airflow import DAG
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import KubernetesPodOperator
from datetime import datetime

with DAG(
    dag_id="spark_batch_job",
    start_date=datetime(2023, 1, 1),
    schedule_interval="@daily",
    catchup=False,
) as dag:

    spark_job = KubernetesPodOperator(
        name="spark-job",
        task_id="run-spark",
        namespace="default",
        image="spark:latest",
        cmds=["/opt/spark/bin/spark-submit", "--class", "com.example.job", "local://opt/jobs/job.jar"],
        get_logs=True
    )
