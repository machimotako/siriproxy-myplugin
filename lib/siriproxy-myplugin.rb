require "siriproxy-myplugin/version"
require 'cora'
require 'siri_objects'
require 'pp'

#module Siriproxy
#  module Myplugin
#    # Your code goes here...
#  end
#end

#######
# This is a "hello world" style plugin. It simply intercepts the phrase "test siri proxy" and responds
# with a message about the proxy being up and running (along with a couple other core features). This
# is good base code for other plugins.
#
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Myplugin < SiriProxy::Plugin
  def initialize(config)
    #if you have custom configuration options, process them here!
  end

  listen_for /あいうえお/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /テスト プラグイン/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /test hi/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

end
