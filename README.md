# Selfhosting Amanda

## Please note

Amanda was not originally designed as an open-source project. This code is published for
transparency, rather than to encourage people to run it themselves.
You should use the official Amanda (https://amanda.moe/to/add) for day-to-day
use as it is against the license to self host unmodified versions of Amanda.
Nevertheless, the process to get a copy of Amanda up and
running on your own machines is documented here, for those who want it.

Please read the entire file before actually doing anything. You may find
that a later step, and as such the entire guide, is impossible for you
to complete; Therefore, reading it first will save you time by not attempting
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

### Redis

Amanda, by default, caches some Objects sent by Discord in Redis as a
form of semi-persistent storage for all worker nodes to access.

It is highly recommended that you put Redis on a machine with at least 8GB
of RAM. Having a CPU with good single core performance is optional, but
strongly recommended. the volume of data sent by Discord in the form of GUILD_CREATE
payloads on gateway identify can starve the instance of resources on lower end hardware.

No additional setup is required, but it is recommended to protect the instance with a password
and change the HTTP port Redis' web server uses.

### RabbitMQ

If you're lucky enough to get RabbitMQ to install, Amanda's cache library depends on an AMQP
message broker. (the hardest part is getting erlang to install. If you already have erlang installed,
you should have relative ease installing RabbitMQ.)

### Lavalink

Amanda uses Lavalink as its audio processor. [Download an appropriate
version][lavalink] of Lavalink, or build your own, and run it on a server. PLEASE NOTE
that as of writing this, audio filters has not been merged from Lavalink/dev into master
You should install/build a version which supports OP filters. It does
not need to be geographically close to the bot host. You should put it
close to the Discord voice regions that you want to stream to.

[lavalink]: https://github.com/Frederikam/Lavalink/blob/master/README.md#server-configuration

You may use the provided `application.yml` file.

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
with region blocking on some songs. We suggest you run Invidious on a machine
in the same data center as the Lavalink node.

You can either [build and run regular Invidious][invidious], but this
can be difficult to install and run, so you can instead use [Cadence's
Second project][second] which runs different code, but mirrors the same API
in a mostly-compatible way and uses significantly less resources.
We suggest you use Second.

[invidious]: https://github.com/omarroth/invidious
[second]: https://git.sr.ht/~cadence/Second

There are also some [public Invidious servers][pubinvidious] that you
can use if you want Invidious without selfhosting. Just make sure you
use ones in the same country as your Lavalink node.

[pubinvidious]: https://github.com/iv-org/documentation/blob/master/Invidious-Instances.md

### Bot

Clone Amanda's repo.

Run `npm install`.

## Setup

With everything installed and running, you now have to configure it.

### Bot config files

Open `config.sample.js` in the bot repo and fill in the details. You
must fill in everything.

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
1. Open a terminal and change to the base directory of the cloned bot repo.
1. Run `npm run website` to start the web process, which also doubles as
   a cluster coordinator.
1. Open 3 other terminals, and again change to the base directory of the
   repo for each and run the commands below, each in a separate terminal.
1. Run `node workers/rest.js`
1. Run `node workers/cache.js`
1. Run `npm run start`
