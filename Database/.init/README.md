This directory contains initialization metadata for the Database container.

Contents:
- .init-build-cmd: JSON with:
  - working_directory: absolute path to the Database folder
  - command: runs 'startup.sh' (no-op init)
- .init-test-tool: JSON with:
  - working_directory: absolute path to the Database folder
  - command: runs 'psql_test.sh' (optional DB connectivity test)
- .linter.sh: no-op linter shim (exit 0)

Notes:
- There is intentionally no reference to any 'db_visualizer' directory.
- Do not change working_directory to invalid paths.
- Keep commands within this Database directory to avoid relative path issues in CI.
