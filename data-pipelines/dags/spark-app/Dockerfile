FROM python:3.9-slim

# העתקת קובץ requirements לקונטיינר
COPY requirements.txt ./

# התקנת התלויות מתוך requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# חשיפת פורט 8080 (ל-Airflow)
EXPOSE 8080

# פקודת ברירת מחדל להפעלת האפליקציה
CMD ["python", "data-pipelines/dags/spark_batch_job.py"]
