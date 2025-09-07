FROM python:3.9-slim

ENV AIRFLOW_HOME=/app
WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

CMD ["airflow", "standalone"]
