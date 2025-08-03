#!/bin/bash
set -e

# Use PORT environment variable from Fly.io, fallback to 8080
PORT=${PORT:-8080}

# Run the application with HTTP transport
exec node cli.js --headless --browser chromium --no-sandbox --host 0.0.0.0 --port "$PORT" 