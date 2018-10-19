#!/bin/bash

if [ ! -f /app/README.md ]; then
	git clone git://git.zx2c4.com/PhotoFloat /app
	rm /app/web/js/999-googletracker.js
	cd /app/web && make
fi

if [ ! -d /app/web/albums ]; then
	mkdir /app/web/albums
fi

if [ ! -d /app/web/cache ]; then
	mkdir /app/web/cache
fi