require 'formula'

class GaeSdk < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.32.zip'
  sha1 'ad9c5552108afa5926cd80b452d18a108af22deb'

  def patches
    [
      "https://raw.githubusercontent.com/HubSpot/homebrew-gae_sdk/master/task-queue-hostnames.patch",
    ]
  end

  def install
    cd ".."
    share.install "google_appengine" => name
    %w[
      _python_runtime.py
      _php_runtime.py
      api_server.py
      appcfg.py
      backends_conversion.py
      bulkload_client.py
      bulkloader.py
      dev_appserver.py
      download_appstats.py
      endpointscfg.py
      gen_protorpc.py
      google_sql.py
      php_cli.py
      remote_api_shell.py
      run_tests.py
      wrapper_util.py
    ].each do |fn|
      bin.install_symlink share/name/fn
    end
    mkdir "google_appengine"
  end
end
