require "siriproxy-myplugin/version"
require 'cora'
require 'siri_objects'
require 'pp'
require 'iremocon'

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

# 以下のプラグインを参考に、iremoconと連携しました
# git://github.com/katsuma/SiriProxy-iRemocon.git

class SiriProxy::Plugin::Myplugin < SiriProxy::Plugin
  attr_accessor :host, :signals

  def initialize(config)
    #if you have custom configuration options, process them here!
    self.host = config["host"]
    self.signals = config["signals"]
  end

  def signal_to_iremocon(signal)
    iremocon = ::Iremocon.new(self.host)
    if signal.kind_of? Array
      signal.each do |s|
        iremocon.is(s)
        sleep 0.5
      end
    else
      iremocon.is(signal)
    end
    iremocon.telnet.close
  end

  listen_for /(きっと|キット|キッド)/ do
    response = ask "何か御用ですか？"
    if response =~ /照明をつけて/
      say "わかりました"
      signal_to_iremocon(signals['light']['power'][true])
    elsif response =~ /照明を消して/
      say "わかりました"
      signal_to_iremocon(signals['light']['power'][false])
    elseif response =~ /テレビを(つけて|付けて|けして|消して)/
      say "わかりました"
      signal_to_iremocon(self.signals['stb']['power'])
    else
      say "聞き取れませんでした。"
    end

    request_completed

  end

  listen_for /テレビを(つけて|付けて|けして|消して)/ do
    say "わかりました"
    signal_to_iremocon(self.signals['stb']['power'])
    request_completed
  end

  listen_for /ライトを(つけて|付けて)/ do
    say "わかりました"
    signal_to_iremocon(signals['light']['power'][true])
    request_completed
  end

  listen_for /ライトを(けして|消して)/ do
    say "わかりました"
    signal_to_iremocon(signals['light']['power'][false])
    request_completed
  end

  listen_for /あいうえお/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /テスト?プラグイン/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /test?hi/i do
    say "こんにちは。Siri Proxyです。"
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

  listen_for /hi/i do
    say "This is Siri Proxy."
    request_completed #always complete your request! Otherwise the phone will "spin" at the user!
  end

end
