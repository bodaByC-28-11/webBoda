#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/docs"

port="${1:-4001}"

echo "Sirviendo webBoda en http://127.0.0.1:${port}/"
PYENV_SKIP_REHASH=1 bundle exec jekyll serve \
	--config _config.yml,_config.local.yml \
	--host 127.0.0.1 \
	--port "$port"
