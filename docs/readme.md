# Unofficial [GTFS Realtime](https://gtfs.org/reference/realtime/v2/) feed for Schleswig-Holstein

**This endpoint provides realtime transit data for Schleswig-Holstein & Hamburg in the [GTFS Realtime (GTFS-RT)](https://gtfs.org/reference/realtime/v2/) format.**

[![API status](https://badgen.net/uptime-robot/status/todo)](https://stats.uptimerobot.com/todo/todo)

<iframe id="inspector" title="gtfs-rt-inspector showing this feed" loading="lazy" src="https://public-transport.github.io/gtfs-rt-inspector/?feedUrl=https%3A%2F%2Ftodo%2Ffeed&feedSyncStopped=true" style="width: 100%; height: 50vh; min-height: 20em; border: 1px solid #333; box-sizing: border-box"></iframe>

Underneath, it works by polling the [nah.SH](https://de.wikipedia.org/wiki/Nahverkehrsverbund_Schleswig-Holstein) [HAFAS endpoint](https://github.com/public-transport/hafas-client/tree/5/p/nahsh) underneath. Those interested in delays of *all* vehicles, instead of a particular one, don't have to poll nah.SH's API brute-force: They're able to fetch the data efficiently from here.

*Note:* This feed is run by people *not related* to [nah.SH](https://de.wikipedia.org/wiki/Nahverkehrsverbund_Schleswig-Holstein) and the government.


## Why use this API?

- **Realtime Data** – This API returns realtime data whenever the underlying [API for nah.SH's mobile app](https://github.com/public-transport/hafas-client/tree/5/p/nahsh) provides it.
- **No API Key** – You can just use the API without authentication.
- **CORS** – This API has [CORS](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS) enabled, so you can query it from any webpage.
- **Caching-friendly** – This API sends [`ETag`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag) & [`Date`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date) headers, allowing clients to cache responses properly.


## Getting Started

*Note:* This project is work-in-progress, the feed might go offline at any time! I'm happy to receive any kind of feedback via the [`nahsh-gtfs-rt-server` GitHub Issues](https://github.com/derhuerst/nahsh-gtfs-rt-server/issues).

**The URL of the GTFS-RT feed is [`https://todo/feed`](https://todo/feed).**

As an example, let's use [`print-gtfs-rt-cli`](https://github.com/derhuerst/print-gtfs-rt-cli) and [`jq`](https://stedolan.github.io/jq/) to inspect it:

```shell
curl 'https://todo/feed' -s | print-gtfs-rt --json | head -n 1 | jq
```

```json
todo
```
