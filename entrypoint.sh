#!/bin/bash
set -e

# Use PORT environment variable from Fly.io, fallback to 8080
PORT=${PORT:-8080}

random_chromium_user_agent_strings=(
  'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/114.0.5775.194 Chrome/114.0.5775.194 Safari/537.36'
  'Mozilla/5.0 (X11; U; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/115.0.5810.222 Chrome/115.0.5810.222 Safari/537.36'
  'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/123.0.6263.219 Chrome/123.0.6263.219 Safari/537.36'
  'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/123.0.6348.219 Chrome/123.0.6348.219 Safari/537.36'
  'Mozilla/5.0 (X11; Linux x86_64; SMARTEMB Build/3.4.10018) AppleWebKit/537.36 (KHTML, like Gecko) Chromium/76.0.3809.111 Chrome/76.0.3809.111 Safari/537.36'
  'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/123.0.6318.203 Chrome/123.0.6318.203 Safari/537.36'
  'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/124.0.6302.223 Chrome/124.0.6302.223 Safari/537.36'
  'Mozilla/5.0 (Linux; Android 11; CPH2269) AppleWebKit/537.36 (KHTML, like Gecko) Chromium/127.0.6533.120 Mobile Safari/537.36 Brave/1.68.141'
  'Mozilla/5.0 (Linux; Android 11; CPH2269) AppleWebKit/537.36 (KHTML, like Gecko) Brave/1.68.141 Chromium/127.0.6533.120 Mobile Safari/537.36'
)

# Run the application with HTTP transport
exec node cli.js --headless --browser chromium --no-sandbox --host 0.0.0.0 --port "$PORT" --user-agent "${random_chromium_user_agent_strings[ $RANDOM % ${#random_chromium_user_agent_strings[@]} ]}"