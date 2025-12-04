This .init directory at the workspace root provides shared initialization helpers for the Database container.

Files:
- .linter.sh: No-op linter shim (exit 0)

Notes:
- There are no references to any 'db_visualizer' directory.
- The Database container uses working_directory = travel-guide-project-219250-219292/Database.
- All commands execute within that directory without backgrounding.
