# Tailnudge

Utility to send OSX notifications while tailing one or more files for
pattern matches.

Useful if you'd like to be notified when, eg, a log displays a
deprecation or error notice during development.

## Installation


```sh
$ gem install tailnudge
```

## Usage

See:

```sh
$ tailnudge help tail
```

## Examples

Tail a log and look for lines that include "DEPRECATION" or
"DEPRECATED", and play the "Tink" sound.

```sh
$ tailnudge log/development.log -p deprecat -t 'My App' -s Tink
```

Note that patterns are case-insensitive and that only one notification
per pattern will be displayed at a time (to prevent inadvertent event
flooding) unless you use the `--all`/`-a` option.

Notify Rails HTTP 200 request times, without throttling:

```sh
$ tailnudge log/development.log -a -p 'Completed 200 OK in (\d+m?s)' -t 'Requests'
```

Notify when HTTP 500 or 404 is encountered (but only show one 500/404
notication at a time; no `-a` option, and throttling is done per-pattern):

```sh
$ tailnudge log/development.log -p 'Completed 500' 'Completed 404' -t 'HTTP 404/500'
```

Notify when HTTP 5XX or 404 is encountered (but only show one 500 or
404 at a time; no `-a` option, and throttling is done per-pattern):

```sh
$ tailnudge log/development.log -p 'Completed [45]\d{2}' -t 'HTTP 4XX/5XX'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
