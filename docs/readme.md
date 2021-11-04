# Unofficial [GTFS Realtime](https://gtfs.org/reference/realtime/v2/) feed for Schleswig-Holstein

**This endpoint provides realtime transit data for Schleswig-Holstein & Hamburg in the [GTFS Realtime (GTFS-RT)](https://gtfs.org/reference/realtime/v2/) format.**

*Note:* This feed is currently shut off as requested by Nah.SH.

[![API status](https://shields.io/uptimerobot/status/m789602581-59189e6b36aca6542d1e0eea)](https://stats.uptimerobot.com/57wNLs39M/789602581)

<iframe id="inspector" title="gtfs-rt-inspector showing this feed" loading="lazy" src="https://public-transport.github.io/gtfs-rt-inspector/?feedUrl=https%3A%2F%2Fv0.sh-gtfs-rt.transport.rest%2Ffeed" style="width: 100%; height: 50vh; min-height: 20em; border: 1px solid #333; box-sizing: border-box"></iframe>

Underneath, it works by polling the [nah.SH](https://de.wikipedia.org/wiki/Nahverkehrsverbund_Schleswig-Holstein) [HAFAS endpoint](https://github.com/public-transport/hafas-client/tree/5/p/nahsh) underneath. Those interested in delays of *all* vehicles, instead of a particular one, don't have to poll nah.SH's API brute-force: They're able to fetch the data efficiently from here.

*Note:* This feed is run by people *not related* to [nah.SH](https://de.wikipedia.org/wiki/Nahverkehrsverbund_Schleswig-Holstein) and the government.


## Why use this API?

- **Realtime Data** – This API returns realtime data whenever the underlying [API for nah.SH's mobile app](https://github.com/public-transport/hafas-client/tree/5/p/nahsh) provides it.
- **No API Key** – You can just use the API without authentication.
- **CORS** – This API has [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) enabled, so you can query it from any webpage.
- **Caching-friendly** – This API sends [`ETag`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) & [`Date`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date) headers, allowing clients to cache responses properly.


## Getting Started

*Note:* This project is work-in-progress, the feed might go offline at any time! I'm happy to receive any kind of feedback via the [`nahsh-gtfs-rt-server` GitHub Issues](https://github.com/derhuerst/nahsh-gtfs-rt-server/issues).

**The URL of the GTFS-RT feed is [`https://v0.sh-gtfs-rt.transport.rest/feed`](https://v0.sh-gtfs-rt.transport.rest/feed).**

As an example, let's use [`print-gtfs-rt-cli`](https://github.com/derhuerst/print-gtfs-rt-cli) and [`jq`](https://stedolan.github.io/jq/) to inspect it:

```shell
curl 'https://v0.sh-gtfs-rt.transport.rest/feed' -s | print-gtfs-rt --json | head -n 1 | jq
```

```json
{
	"id": "13040",
	"trip_update": {
		"trip": {
			"trip_id": "199942657",
			"start_time": "15:45:00",
			"start_date": "20211101",
			"route_id": "43229_2"
		},
		"stop_time_update": [
			{
				"stop_sequence": 0,
				"departure": {
					"time": 1635777900
				},
				"stop_id": "000008000238",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 1,
				"arrival": {
					"time": 1635778380
				},
				"departure": {
					"time": 1635778380
				},
				"stop_id": "000008001646",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 2,
				"arrival": {
					"time": 1635778680
				},
				"departure": {
					"time": 1635778740
				},
				"stop_id": "000008003577",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 3,
				"arrival": {
					"time": 1635779280
				},
				"departure": {
					"delay": 180,
					"time": 1635779520
				},
				"stop_id": "000008000058",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 4,
				"arrival": {
					"delay": 120,
					"time": 1635780180
				},
				"departure": {
					"delay": 120,
					"time": 1635780240
				},
				"stop_id": "000008004057",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 5,
				"arrival": {
					"delay": 120,
					"time": 1635780660
				},
				"departure": {
					"delay": 60,
					"time": 1635780780
				},
				"stop_id": "000008004952",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 6,
				"arrival": {
					"delay": 0,
					"time": 1635781200
				},
				"departure": {
					"delay": 60,
					"time": 1635781260
				},
				"stop_id": "000009057774",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 7,
				"arrival": {
					"delay": 0,
					"time": 1635781440
				},
				"departure": {
					"delay": 60,
					"time": 1635781500
				},
				"stop_id": "000009057832",
				"schedule_relationship": 0
			},
			{
				"stop_sequence": 8,
				"arrival": {
					"delay": 0,
					"time": 1635781920
				},
				"stop_id": "000009057819",
				"schedule_relationship": 0
			}
		],
		"vehicle": {
			"id": "11824",
			"label": "Lübeck Hbf"
		},
		"delay": 120
	}
}
```
