#!/bin/env bash

set -eu

BMD_VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/inokawazu/brand-me-docs/releases/latest)
BMD_VERSION=${BMD_VERSION##*/}
printf "The version is %s\n" "$BMD_VERSION"

curl -L --output static/cv.pdf https://github.com/inokawazu/brand-me-docs/releases/download/${BMD_VERSION}/cv.pdf
curl -L --output static/publications.pdf https://github.com/inokawazu/brand-me-docs/releases/download/${BMD_VERSION}/publications.pdf
