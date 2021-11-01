#!/bin/bash

set -e
set -o pipefail
set -x

# gtfs.mfdz.de mirrors the Nah.SH GTFS dataset requiring a token from connect-info.net
#wget -O gtfs.zip 'http://www.connect-info.net/opendata/gtfs/nah.sh/%CONNECT-INFO-TOKEN%'

# gtfs.mfdz.de mirrors the Nah.SH GTFS dataset without a token
wget -O gtfs.zip 'https://gtfs.mfdz.de/NAH.SH.raw.gtfs.zip'
unzip -o -d gtfs -j gtfs.zip

env | grep '^PG'

NODE_ENV=production node_modules/.bin/gtfs-to-sql -d --trips-without-shape-id --routes-without-agency-id -- \
	gtfs/agency.txt \
	gtfs/calendar.txt \
	gtfs/calendar_dates.txt \
	gtfs/frequencies.txt \
	gtfs/routes.txt \
	gtfs/shapes.txt \
	gtfs/stop_times.txt \
	gtfs/stops.txt \
	gtfs/transfers.txt \
	gtfs/trips.txt \
	| psql -b

lib="$(dirname $(realpath $0))/lib"
NODE_ENV=production node_modules/.bin/build-gtfs-match-index \
	$lib/hafas-info.js $lib/gtfs-info.js \
	| psql -b
