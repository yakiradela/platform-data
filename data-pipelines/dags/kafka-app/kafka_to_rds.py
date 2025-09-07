from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def consume_kafka():
    import kafka
    print("TODO: Add real Kafka consumption logic here")

with DAG(
    dag_id="kafka_to_rds",
    start_date=datetime(2023, 1, 1),
    schedule_interval="@hourly",
    catchup=False,
) as dag:
    task = PythonOperator(
        task_id="consume_kafka",
        python_callable=consume_kafka
    )
