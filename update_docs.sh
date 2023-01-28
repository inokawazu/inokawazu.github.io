#!/usr/bin/env bash

pushd _assets
pushd brand-me-docs

git pull --all

popd

cp -v brand-me-docs/build/*pdf .

popd
