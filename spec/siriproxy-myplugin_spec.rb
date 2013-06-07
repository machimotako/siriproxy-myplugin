#coding: UTF-8
#日本語

$:.unshift('lib', '../SiriProxy/lib')
require 'ostruct'
require 'yaml'
require 'siriproxy'
require 'siriproxy/plugin'
require 'siriproxy/plugin_manager'
require 'siriproxy-myplugin'

$LOG_LEVEL = 0

describe "siriproxy-myplugin" do

  describe "Iremocon" do
    it "is success." do

      plugin = SiriProxy::Plugin::Myplugin.new("config_sample.xml")
      plugin.plugin_name = "Myplugin"
      plugin.manager = self
      plugin.stub(:log)
      #plugin.process("キッド")
    end
    it "is success. 2" do
      $APP_CONFIG = OpenStruct.new(YAML.load_file("config_sample.xml"))
      plugin_manager = SiriProxy::PluginManager.new
      plugin = plugin_manager.plugins[0]
      #plugin.process("キッド")
    end
  end

end

