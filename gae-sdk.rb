require 'formula'

class GaeSdk < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'http://googleappengine.googlecode.com/files/google_appengine_1.8.7.zip'
  sha1 'bae18f89afd0521ed10ef1245daf5f732f1e5e48'

  def patches
    [
      "https://raw.github.com/dylanvee/homebrew-gae_sdk/master/task-queue-hostnames.patch",
      "https://raw.github.com/dylanvee/homebrew-gae_sdk/master/watcher-skip-files.patch",
      "https://raw.github.com/dylanvee/homebrew-gae_sdk/master/fsevents-file-watcher.patch",
      "https://raw.github.com/dylanvee/homebrew-gae_sdk/master/fix-getaddrinfo-proto.patch"
    ]
  end

  def install
    cd '..'
    share.install 'google_appengine' => name
    bin.mkpath
    %w[
      _python_runtime.py
      _php_runtime.py
      api_server.py
      appcfg.py
      bulkload_client.py
      bulkloader.py
      dev_appserver.py
      download_appstats.py
      endpointscfg.py
      gen_protorpc.py
      google_sql.py
      old_dev_appserver.py
      remote_api_shell.py
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
