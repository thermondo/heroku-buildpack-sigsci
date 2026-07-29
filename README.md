# Signal Sciences Heroku Buildpack

Run the Signal Sciences ([Fastly WAF](https://www.fastly.com/products/web-application-api-protection))
agent inside Heroku.

## Why?

The [official Signal Sciences buildpack](https://docs.fastly.com/en/ngwaf/heroku) has no license
and does things we don't necessarily want (or need). This is thermondo's implementation based on
our [sigsci-container project](https://github.com/thermondo/sigsci-container).

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

## Configuration

Required environment variables:

* `SIGSCI_BUILDPACK_ACCESSKEYID`: SigSci access key ID. `SIGSCI_ACCESSKEYID` is also supported.
* `SIGSCI_BUILDPACK_SECRETACCESSKEY`: SigSci access key secret. `SIGSCI_SECRETACCESSKEY` is also
  supported.

Optional environment variables:

* `SIGSCI_BUILDPACK_UPSTREAM_PORT`: The port your app is listening on. It defaults to `2000` if not
  specified, and re-exports this environment variable so your app can use it even if you don't
  specify it. **Make sure it never conflicts with the `PORT` environment variable!** The default
  value is a safe value.
* `SIGSCI_BUILDPACK_WAIT_ENDPOINT`: An HTTP endpoint on your app that will be used to determine if
  your app is up and running. When your app starts responding at this endpoint, the SigSci agent
  will begin starting up. Example: Setting the value to `version` will cause the SigSci agent to
  wait for `http://127.0.0.1:${SIGSCI_BUILDPACK_UPSTREAM_PORT}/version` to respond.
* `SIGSCI_BUILDPACK_WAIT_TIMEOUT`: How long to wait, in seconds, for your app to respond. Defaults
  to 60 seconds.
* `SIGSCI_BUILDPACK_STATUS`: Set to `disabled` to temporarily disable the SigSci agent. This will
  also cause the `SIGSCI_BUILDPACK_UPSTREAM_PORT` environment variable to be set to the same value
  as `PORT` before starting your application, causing your application to receive requests directly
  from the downstream router.

## Developing

### Creating Releases

Go to [the release workflow](https://github.com/thermondo/heroku-buildpack-sigsci/actions/workflows/release.yml)
and manually trigger a release. Specify an appropriate tag name using semantic versioning rules.

Then go to the newly created draft release on the [releases page](https://github.com/thermondo/heroku-buildpack-sigsci/releases),
polish it up, and publish it.
