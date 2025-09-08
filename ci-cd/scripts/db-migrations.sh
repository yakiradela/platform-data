#!/bin/bash
set -e

echo "Running DB migrations..."
python tools/run_migrations.py
echo "Done."
