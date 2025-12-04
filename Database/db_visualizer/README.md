# Simple DB Viewer (Optional Tool)

This is a lightweight Node.js/Express app to inspect databases during development. It is NOT required for the Database container to be healthy. PostgreSQL runs independently via startup.sh. Only run this tool if you need a quick in-container viewer.

Prerequisites
- Node.js 18+ and npm available in the container or environment
- For PostgreSQL viewing, ensure the DB is running and the connection envs are set (see postgres.env)

Install
- From this folder:
  1) npm install
  2) source postgres.env (optional, to load local vars) or set equivalent environment variables

Run
- npm start
- The viewer will start at http://localhost:3000 by default

Environment variables
- PostgreSQL: POSTGRES_URL, POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB, POSTGRES_PORT
- MySQL: MYSQL_URL, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB, MYSQL_PORT
- SQLite: SQLITE_DB
- MongoDB: MONGODB_URL, MONGODB_DB

Notes
- This app is intentionally NOT started by the main Database startup.sh to avoid any Node module issues from affecting the health of the PostgreSQL service.
- If you see "Cannot find module 'express'", run "npm install" in this directory to install dependencies before starting the server.
