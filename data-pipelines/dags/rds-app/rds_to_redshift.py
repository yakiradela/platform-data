from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="rds_to_redshift",
    start_date=datetime(2023, 1, 1),
    schedule_interval="@daily",
    catchup=False,
) as dag:

    extract_and_load = BashOperator(
        task_id="extract_and_load",
        bash_command="python /app/tools/rds_to_redshift.py"
    )
