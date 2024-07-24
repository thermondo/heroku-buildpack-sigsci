#!/usr/bin/env bash
set -Eeuo pipefail

gh release create "${RELEASE_TAG}" --draft --generate-notes

artifact="buildpack.tar.gz"
rm -f "${artifact}"
tar czf "${artifact}" bin
gh release upload "${RELEASE_TAG}" "${artifact}" --clobber
