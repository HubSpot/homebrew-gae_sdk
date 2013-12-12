# Introduction

This repository contains a Homebrew formula for installing the Google App
Engine SDK with some custom patches. It will be kept up to date with the latest
SDK version that is known to be acceptable for Khan Academy development. It
does not conflict with existing installations of the mainline
`google-app-engine` formula, but only one of these can be `brew link`'d at a
time so you may want to `brew remove` it anyway.

Issues and pull requests gladly accepted, and feel free to steal these patches
for use in a non-Homebrew setup.

# Installation

**Important:** If you have ever used GoogleAppEngineLauncher.app, you might
have *.py symlinks to it in /usr/local/bin that must be deleted before Homebrew
will link this formula correctly.

    brew unlink google-app-engine
    brew tap dylanvee/gae_sdk
    brew install gae-sdk

# Included patches

**task-queue-hostnames.patch:** Fixes task queues on SDK version 1.8.x when
using Nginx as a reverse proxy. Works by assigning task queue requests with an
unrecognized Host header to the default instance instead of dropping them.

**watcher-skip-files.patch:** Modifies the mtime polling based file watcher to
be aware of the skip_files directives in your app.yaml.

**fsevents-file-watcher.patch:** Restores the FSEvents-based file watcher for
Mac OS X. See the comment at the bottom of
google/appengine/tools/devappserver2/file_watcher.py for information about
its limitations and why it was originally removed from the SDK.

**fix-getaddrinfo-proto.patch:** Fixes an issue where the SDK's WSGI server can
sometimes fail with the error "Unable to find a consistent port localhost" when
starting up.

**fsevents-ignore.patch:** Makes the aforementioned FSEvents-based file watcher
ignore the directories (e.g. ".git") and file extensions (e.g. ".pyc") listed
in `google.appengine.tools.devappserver2.watcher_common`.

**ignore-genfiles.patch:** Adds "genfiles" (a Khan Academy-specific build
artifact directory) to the aforementioned list of ignored directories.
