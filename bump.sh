#!/bin/sh
# Нова версія сайту: відкриті сторінки самі побачать оновлення (version.json)
V=$(date -u +%Y%m%d-%H%M%S)
sed -i "s/^const APP_V = '[^']*';/const APP_V = '$V';/" index.html test.html
printf '{"v":"%s"}\n' "$V" > version.json
echo "$V"
