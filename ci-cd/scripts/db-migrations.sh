#!/bin/bash
set -e

echo "Running DB migrations..."
python data-pipelines/dags/rds-app/tools/run_migrations.py
echo "Done."
