#!/usr/bin/env bash
# PUBLIC_INTERFACE
# Executes a simple connectivity/version check against PostgreSQL by reading
# the connection string from db_connection.txt, in line with project rules.
# - ALWAYS read connection from db_connection.txt
# - Execute SQL statements ONE AT A TIME via psql -c "..."
# - Do not hard code credentials

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONN_FILE="${SCRIPT_DIR}/db_connection.txt"

if [[ ! -f "${CONN_FILE}" ]]; then
  echo "[Database] psql_test.sh: db_connection.txt not found at ${CONN_FILE}. Skipping DB connectivity test."
  exit 0
fi

CONN_CMD="$(cat "${CONN_FILE}")"
if [[ -z "${CONN_CMD}" ]]; then
  echo "[Database] psql_test.sh: db_connection.txt is empty. Skipping DB connectivity test."
  exit 0
fi

echo "[Database] Running version check via: ${CONN_CMD} -c \"SELECT version();\""
# Execute the SQL statement one at a time
bash -lc "${CONN_CMD} -c \"SELECT version();\""
echo "[Database] PostgreSQL version check completed."
