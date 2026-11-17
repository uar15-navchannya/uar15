#!/bin/sh
# Нова версія сайту: відкриті сторінки самі побачать оновлення (version.json)
# Використання: ./bump.sh "що оновлено" — текст покаже віконце оновлення
V=$(date -u +%Y%m%d-%H%M%S)
sed -i "s/^const APP_V = '[^']*';/const APP_V = '$V';/" index.html test.html
python3 -c 'import json,sys; print(json.dumps({"v": sys.argv[1], "note": sys.argv[2]} if sys.argv[2] else {"v": sys.argv[1]}, ensure_ascii=False))' "$V" "${1:-}" > version.json
echo "$V"
