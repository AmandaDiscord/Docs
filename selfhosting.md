# Selfhosting Amanda

## Please note

Amanda was not originally designed as an open-source project, and was
not designed with selfhosting as a goal. This code is published for
transparency, rather than to encourage people to run it themselves.
We'd really rather you use the official Amanda for day-to-day
activity. Nevertheless, the process to get a copy of Amanda up and
running on your own machines is documented here, for those who want it.

Please read the entire file before actually doing anything. You may find
that a later step, and as such the entire guide, is impossible for you
to complete, so reading it first will save you time by not attempting
the previous steps first.

## Register

Amanda depends on these services which are already hosted by other
people. You'll need to sign up for them.

### Bot application

[Create an application on Discord,][bot application] then create a bot
account with it. Note the token.

[bot application]: https://discord.com/developers/applications

### YouTube API

Sign up for the YouTube API and generate a key.

### Chewey API

[Sign up for the Chewey API and claim an API key.][chewey api]

[chewey api]: https://api.chewey-bot.top/random

### weeb.sh API

Get a [weeb.sh](https://weeb.sh/) API token, somehow.

### Pannous Jeannie API

This is for the AI module. Let us know if you manage to figure out how
to get an API token.

## Services

Amanda requires several components which must all be installed
first. Not all of them need to be installed on the same machine.

### MySQL

Amanda stores data in MySQL.

MariaDB is a compatible fork of MySQL, and you can use either.

Create a MySQL server with a user `amanda` and a database
`money`. Despite the name, all data is stored in `money`. You will want
the MySQL server to be geographically close to the location where you
will host the bot. Either on the same machine, or on a different machine
in the same datacentre, will be great.

Make sure the database is set to use UTF-8.

### Lavalink

Amanda uses Lavalink as its audio processor. [Download an appropriate
version][lavalink] of Lavalink, or build your own, and run it on a server. It does
not need to be geographically close to the bot host. You should put it
close to the Discord voice regions that you want to stream to.

[lavalink]: https://github.com/Frederikam/Lavalink/blob/master/README.md#server-configuration

Use the provided `application.yml` file.

### Invidious

Invidious is optional, but highly recommended if your IP address plays more than ~800
songs in 24 hours.

Amanda can switch to getting data from YouTube using Invidious if there
are problems with Lavalink's default extractor. When this mode is
activated, YouTube URLs will be sent to Invidious, Invidious will
extract and return stream URLs, and Amanda will send the stream URLs to
Lavalink.

When using Invidious, the Invidious node must be in the same country
(well, the country detected by YouTube, which isn't very good) as the
Lavalink node that will play it, otherwise you will encounter problems
with region blocking on some songs. We suggest you run Invidious on the
same machine as the Lavalink node.

You can either [build and run regular Invidious][invidious], but this
can be difficult to install and run, so you can instead use [Cadence's
ytdi project][ytdi] which runs different code, but mirrors the same API
in a mostly-compatible way. We suggest you use ytdi.

[invidious]: https://github.com/omarroth/invidious
[ytdi]: https://github.com/cloudrac3r/youtubedl-invidious

There are also some [public Invidious servers][public servers] that you
can use if you want Invidious without selfhosting. Just make sure you
use ones in the same country as your Lavalink node.

### Bot

Clone the bot repo.

Run `npm install`.

## Setup

With everything installed and running, you now have to configure it.

### Bot config files

Open `config.sample.js` in the bot repo and fill in the details. You
must fill in `bot_token`, `mysql_password`, `yt_api_key`,
`chewey_api_key`, `lavalink_password`, `weeb_api_key`, `machine_id`,
`mysql_domain`.

Then, open `constants.js` in the bot repo and fill in some more
details. You must fill in `baseURL` and all details under
`lavalinkNodes`.

### Lavalink config

Again, use the `application.yml` file from this repo.

Create a password for the Lavalink server, and put it in the file
where directed.

Restart Lavalink to apply changes.

### Database setup

Again, make sure the database is set to use UTF-8.

Import the schema from the provided `money.sql` file into the `money`
database.

Add your bot's ID and prefixes to `AccountPrefixes`. Set `status` to `1`
if that prefix should be displayed in the bot's status. Only one row can
have `status = 1`, all other rows must be `status = 0`.

Add your user ID to `UserPermissions` and set all options to `1` to
allow them.

## Start

Everything is now set up.

To start Amanda, follow these steps:

1. Make sure all the services are running.
1. Change to the base directory of the cloned bot repo.
1. Run `npm run website` to start the web process, which also doubles as
   a shard coordinator.
1. Open another terminal, and again change to the base directory of the
   repo.
1. Run `npm run start` to start without sharding.

You can alternatively run `npm run shards` to start multiple shards in
the configuration from `config.js`, but you shouldn't need to do this.
