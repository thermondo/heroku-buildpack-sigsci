# Signal Sciences Heroku Buildpack

Run the Signal Sciences ([Fastly WAF](https://www.fastly.com/products/web-application-api-protection))
agent inside Heroku.

## Why?

The [official Signal Sciences buildpack](https://docs.fastly.com/en/ngwaf/heroku) is unmaintained,
has no license, and does things we don't necessarily want (or need). This is thermondo's
implementation based on our [sigsci-container project](https://github.com/thermondo/sigsci-container).

## Quick Start

Get the `buildpack.tar.gz` download URL from [the latest release](https://github.com/thermondo/heroku-buildpack-sigsci/releases/latest).
It should look something like:

```plaintext
https://github.com/thermondo/heroku-buildpack-sigsci/releases/download/LATEST_VERSION_NUMBER/buildpack.tar.gz
```

Then run:

```bash
heroku buildpacks:add <the-buildpack-url>
```

Then in your app's [Procfile](https://devcenter.heroku.com/articles/procfile) add something like this:

```plaintext
web: sigsci-wrap <the command you want to execute>
```

The buildpack is configured the same way the container is (same environment variables, etc.). See
the [Configuration section of the container README](https://github.com/thermondo/sigsci-container?tab=readme-ov-file#configuration)
for details.

## Developing

### Creating Releases

Go to [the release workflow](https://github.com/thermondo/heroku-buildpack-sigsci/actions/workflows/release.yml)
and manually trigger a release. Specify an appropriate tag name using semantic versioning rules.

Then go to the newly created draft release on the [releases page](https://github.com/thermondo/heroku-buildpack-sigsci/releases),
polish it up, and publish it.
