FROM python:3.9-slim

ENV AIRFLOW_HOME=/app

RUN apt-get update && apt-get install -y libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r /app/requirements.txt

COPY . /app/

CMD ["airflow", "standalone"]
