#!/bin/bash
set -e

echo "Running DB migrations..."
python data-pipelines/dags/rds-app/run_migrations.py
echo "Done."
