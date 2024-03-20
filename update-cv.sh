#!/bin/env bash

pushd static/brand-me-docs

git pull
cp -v build/* ..

popd
