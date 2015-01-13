# Introduction

This repository contains a Homebrew formula for installing the Google App
Engine SDK with some custom patches. It will be kept up to date with the latest
SDK version that is known to be acceptable for HubSpot development. It
does not conflict with existing installations of the mainline
`google-app-engine` formula, but only one of these can be `brew link`'d at a
time so you may want to `brew remove` it anyway.

Issues and pull requests gladly accepted, and feel free to steal these patches
for use in a non-Homebrew setup.

# Installation

**Important:** If you have ever used GoogleAppEngineLauncher.app, you might
have *.py symlinks to it in /usr/local/bin that
[must be deleted](http://stackoverflow.com/a/14081488/431079) before Homebrew
will link this formula correctly.

**Important:** If you have previously installed the SDK via Homebrew, you'll
need to unlink it: `brew unlink google-app-engine`

**Installation:**

        brew tap HubSpot/gae_sdk
        brew install gae-sdk

# Included patches

**task-queue-hostnames.patch:** Fixes task queues on SDK version 1.9.x when
using Nginx as a reverse proxy. Works by assigning task queue requests with an
unrecognized Host header to the default instance instead of dropping them.


