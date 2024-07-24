# Signal Sciences Heroku Buildpack

The [current Signal Sciences buildpack](https://dl.signalsciences.net/sigsci-heroku-buildpack/sigsci-heroku-buildpack_latest.tgz)
is unmaintained, has no license, and does things we don't necessarily want (or need).

This is thermondo's implementation based on our [sigsci-container](https://github.com/thermondo/sigsci-container).
It is configured the same way the container is (same environment variables, etc.). See the README
there for details. To use, put something like this in your Procfile:

```plaintext
web: ./sigsci/bin/start <the command you want to execute>
```
