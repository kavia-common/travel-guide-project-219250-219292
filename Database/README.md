# Database Container

PUBLIC_INTERFACE
This container provides PostgreSQL-related initialization helpers for CI/build environments without actually running a database.

Key points:
- There is no 'db_visualizer' directory in this project; any previous references have been removed.
- Startup does not attempt to change directory into non-existent paths.
- Environment-specific DB credentials are never hard-coded. For any tests, connection info must be provided via db_connection.txt.

Files:
- startup.sh (PUBLIC_INTERFACE): No-op initialization that logs environment details and exits successfully.
- psql_test.sh (PUBLIC_INTERFACE): Optional connectivity/version test. Reads connection from db_connection.txt (must contain a full psql command like 'psql postgresql://...') and executes a single SQL command at a time using psql -c.

Init integration:
- .init/.init-build-cmd: Runs startup.sh in the Database directory.
- .init/.init-test-tool: Runs psql_test.sh in the Database directory.
- .init/.linter.sh: No-op linter shim.

Usage:
- To run the optional DB check, create a db_connection.txt next to psql_test.sh containing a single line with the full psql connection command, e.g.:
  psql postgresql://USER:PASSWORD@HOST:PORT/DBNAME

Notes:
- This container is CI-friendly and will not fail if db_connection.txt is missing or empty; psql_test.sh will skip gracefully.
- All SQL must be executed one statement at a time via psql -c "SQL_STATEMENT".
