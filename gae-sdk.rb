require 'formula'

class GaeSdk < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.18.zip'
  sha1 '823b6402241b354450ba20ae86ea578197995b4c'

  def patches
    [
      "https://raw.githubusercontent.com/HubSpot/homebrew-gae_sdk/master/task-queue-hostnames.patch",
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
